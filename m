Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.62.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8022F21
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Apr 2022 14:04:56 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
	by gateway20.websitewelcome.com (Postfix) with ESMTP id A835940106017
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Apr 2022 09:04:55 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with SMTP
	id bNKBnuqaE9AGSbNKBnYJtS; Mon, 04 Apr 2022 09:04:55 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K/Iz8lz+bBMhFV3lQqHqSsiYiXnliRuQPADXVtgEoLk=; b=Az7iEK9SepQCmQLdh9PJHZ8qT2
	ADqqtIX1aD1syu0+xbaRLyozn9T4zbgyk1jrkb+cShj2lJHzQPyHxiihrNbehEDCnvIhyrRqtnFxX
	xWAtD6XQC62QRoPHd54xSDRU0766Y3ruH7hJcyYxl4fxggFbs1INF+kenRJkjCc+gx2w7HjH1Ss8A
	l8L9G0mjD5CIsRPZ82rSuwmXOiuzqCpqOoJolR7/SFezTzDzgmR2yqcjKXwDfQAF70wlHYk0GMBXz
	qDA8If4pNOEPBvSmbh8xPiZg70pdThsN4x+t/DnYkweRLOh9gYhYG09Tm7u/vhbZ4JqZPkKVwDecG
	XYaBNAzg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57852 helo=localhost)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@roeck-us.net>)
	id 1nbNKA-000pyr-Mz; Mon, 04 Apr 2022 14:04:54 +0000
Date: Mon, 4 Apr 2022 07:04:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: watchdog: sunxi: clarify clock
 support
Message-ID: <20220404140453.GA3286578@roeck-us.net>
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317162349.739636-3-andre.przywara@arm.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nbNKA-000pyr-Mz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57852
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

On Thu, Mar 17, 2022 at 04:23:39PM +0000, Andre Przywara wrote:
> Most Allwinner SoCs have just one input clock to drive the watchdog
> peripheral. So far this is the 24 MHz "HOSC" oscillator, divided down
> internally to 32 KHz.
> The F1C100 series watchdog however uses the unchanged 32 KHz "LOSC" as
> its only clock input, which has the same effect, but let's the binding
> description mismatch.
> 
> Change the binding description to name the clocks more loosely, so both
> the LOSC and divided HOSC match the description. As the fixed clock names
> now make less sense, drop them from SoCs supporting just one clock
> input, they were not used by any DT anyway.
> 
> For the newer SoCs, supporting a choice of two input clocks, we keep
> both the description and clock-names requirement.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 7a26cde0afdd..cbcf19f51411 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -39,14 +39,8 @@ properties:
>    clocks:
>      minItems: 1
>      items:
> -      - description: High-frequency oscillator input, divided internally
> -      - description: Low-frequency oscillator input, only found on some variants
> -
> -  clock-names:
> -    minItems: 1
> -    items:
> -      - const: hosc
> -      - const: losc
> +      - description: 32 KHz input clock
> +      - description: secondary clock source
>  
>    interrupts:
>      maxItems: 1
> @@ -71,9 +65,14 @@ then:
>    properties:
>      clocks:
>        minItems: 2
> +      items:
> +        - description: High-frequency oscillator input, divided internally
> +        - description: Low-frequency oscillator input
>  
>      clock-names:
> -      minItems: 2
> +      items:
> +        - const: hosc
> +        - const: losc
>  
>    required:
>      - clock-names
> @@ -83,9 +82,6 @@ else:
>      clocks:
>        maxItems: 1
>  
> -    clock-names:
> -      maxItems: 1
> -
>  unevaluatedProperties: false
>  
>  examples:
