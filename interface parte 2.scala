import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class WifiListAdapter(private val wifiList: List<WifiNetwork>) : RecyclerView.Adapter<WifiListAdapter.ViewHolder>() {
    inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val ssidTextView: TextView = itemView.findViewById(R.id.ssidTextView)
        val securityTextView: TextView = itemView.findViewById(R.id.securityTextView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_wifi, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val wifi = wifiList[position]
        holder.ssidTextView.text = wifi.ssid
        holder.securityTextView.text = "Segurança: ${wifi.securityProtocol}"
    }

    override fun getItemCount(): Int {
        return wifiList.size
    }
}
