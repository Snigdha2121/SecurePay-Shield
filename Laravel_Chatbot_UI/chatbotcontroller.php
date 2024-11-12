namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ChatbotController extends Controller
{
    public function getResponse(Request $request)
    {
        $query = $request->input('query');
        $model = 'zephyr-7b-beta-Q5_K_M'; // Example model

        $response = Http::withHeaders([
            'Authorization' => 'Bearer YOUR_API_KEY',
        ])->post('https://api.vultrinference.com/v1/chat/completions', [
            'messages' => [
                ['role' => 'user', 'content' => $query],
            ],
            'model' => $model,
        ]);

        Log::info('Vultr API Response:', [
            'status_code' => $response->status(),
            'response_body' => $response->body(),
        ]);

        $responseBody = $response->json();

        if ($response->successful() && isset($responseBody['choices'][0]['message']['content'])) {
            return response()->json(['response' => $responseBody['choices'][0]['message']['content']]);
        } else {
            Log::error('Error in API response:', [
                'status_code' => $response->status(),
                'error' => $responseBody,
            ]);
            return response()->json(['error' => 'Sorry, something went wrong. Please try again later.']);
        }
    }
}
