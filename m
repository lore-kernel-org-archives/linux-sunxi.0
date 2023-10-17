Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49CC2D8
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="nbcwPe/Z"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49C166000A;
	Tue, 17 Oct 2023 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1697525062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMTy2aajhBK124+9B/NhradBNHtYp8yU8KpYvs1pqVY=;
	b=nbcwPe/ZaywJ1so6xOi/nu77b3TS9079dNSCr2O6Rmm2OQJAPgKE8eAJhuAEL6oo/1tozM
	kporfPh/mQ5A7ItyPBiQIbWYbOxXkLG4/9U3uZOn3G8TVGmqu7W6wqu/uHaDhiFZW/rFAm
	Hfjoo8N/fRT3lsEgt62KHR5ujnTdaCm9wsVnF36omhVCDwM/zsd6ShJLFn7bc0fqDa5BmH
	WQe9/F37E/8j7JR8hSkJhTgLVEFwj6qumZSYgo+HxpGh/m9EXIWz2CgK6gONtqtV5dBCM+
	q9PGRx9nE9doX75/4yT8xeMnAQylPNobxoBDIyQU5T2F0ZFGJA9btzQy10wE8g==
Message-ID: <1864d057-3b9c-447a-9f00-c8ad2fbb74d1@arinc9.com>
Date: Tue, 17 Oct 2023 09:43:53 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/8] dt-bindings: net: mscc,vsc7514-switch:
 Clean-up example indentation
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 John Crispin <john@phrozen.org>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-6-a525a090b444@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231016-dt-net-cleanups-v1-6-a525a090b444@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

On 17.10.2023 00:44, Rob Herring wrote:
> The indentation for the example is completely messed up for
> 'ethernet-ports'. Fix it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/net/mscc,vsc7514-switch.yaml          | 32 +++++++++++-----------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> index 8ee2c7d7ff42..07de52a3a295 100644
> --- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> @@ -185,7 +185,7 @@ examples:
>       };
>     # VSC7512 (DSA)
>     - |
> -    ethernet-switch@1{
> +    ethernet-switch@1 {
>         compatible = "mscc,vsc7512-switch";
>         reg = <0x71010000 0x10000>,
>               <0x71030000 0x10000>,
> @@ -212,22 +212,22 @@ examples:
>               "port7", "port8", "port9", "port10", "qsys",
>               "ana", "s0", "s1", "s2";
>   
> -            ethernet-ports {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -
> -           port@0 {
> -            reg = <0>;
> -            ethernet = <&mac_sw>;
> -            phy-handle = <&phy0>;
> -            phy-mode = "internal";
> -          };
> -          port@1 {
> -            reg = <1>;
> -            phy-handle = <&phy1>;
> -            phy-mode = "internal";
> -          };
> +      ethernet-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          ethernet = <&mac_sw>;
> +          phy-handle = <&phy0>;
> +          phy-mode = "internal";
> +        };

Could use 4-space indentation as described here.

https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html#example-schema

Regardless:

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç
