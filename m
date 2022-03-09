Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com [192.185.51.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB317C0
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Mar 2022 23:26:19 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
	by gateway24.websitewelcome.com (Postfix) with ESMTP id BB3014CAB5
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Mar 2022 17:02:53 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with SMTP
	id S5KXnlfvyb6UBS5KXnLKhV; Wed, 09 Mar 2022 17:02:53 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/E4QRft2wGBO0a9Wvaf6Y1EmpcR+nckbhrH9ovhYHHQ=; b=CkXCCVHB29d3LEjOS2UK9U2yLM
	plV4p1UzLLEOMDV28uYKD6qtQiGpAe3IAef4N+qOSqSSYn7ESVMEj4tGI9uD5u+PkMlhqIPLIHwXG
	WUqGX7GeTuFG47SIjWGWJmeVqaSyBe/Xh+KkcRri5qVKO9pAr8jQrUz0iUPeM68ij/4PTNZyvvANx
	sXsJ7TDpvLSzc5urnBVaLAe+qnNzkynNcgUTyqTcD48pSn7OLdHZwhXcS3BtVfQdDDd+68KuEwI4J
	1zI9u5Sw3sPicAGGFOJz6iJkbLq941wK6RiV/ONqCVi4oOsOlng0Zaerr4BU0wlZLRoBIL57Z1aVp
	qmaZ8lpw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57400 helo=localhost)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@roeck-us.net>)
	id 1nS5KW-000Boi-Ci; Wed, 09 Mar 2022 23:02:52 +0000
Date: Wed, 9 Mar 2022 15:02:51 -0800
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
Subject: Re: [PATCH 01/14] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
Message-ID: <20220309230251.GA3801394@roeck-us.net>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307143421.1106209-2-andre.przywara@arm.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nS5KW-000Boi-Ci
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57400
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

On Mon, Mar 07, 2022 at 02:34:08PM +0000, Andre Przywara wrote:
> The F1C100 series actually features a newer generation watchdog IP, so
> the compatible string was wrong.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 43afa24513b9..d90655418d0e 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -29,7 +29,7 @@ properties:
>            - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
> -          - const: allwinner,sun4i-a10-wdt
> +          - const: allwinner,sun6i-a31-wdt
>        - const: allwinner,sun20i-d1-wdt
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
