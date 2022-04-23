Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718047C
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Apr 2022 07:00:13 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 58954401F1;
	Sat, 23 Apr 2022 09:00:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id A55982A2AE;
	Sat, 23 Apr 2022 07:00:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7e-EU69GfG7; Sat, 23 Apr 2022 07:00:04 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Sat, 23 Apr 2022 07:00:04 +0000 (UTC)
Received: from [172.16.34.145] (unknown [113.67.11.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 9A4894006D;
	Sat, 23 Apr 2022 06:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1650697203; bh=yPdg0QI5aY/XsFreabP5oAUyZK4YyiVmnZuX8ctGVDY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=KP3UzXALBaQEBT5MkDngOnOF0pdVpdWMjz0TSJaLBe0jHy7WmUKOKvT8Z1yf32D3Y
	 +nGhA2rB16qn/P8gWQv82Dvr7pjy1CJq3wBAPSO2y22bPJBKZ+Y9mXRCpUHoKRiPyc
	 zkyaeu/RqdVZuSfqEBuFJFlnuSMRbTFptf2yoqDQ=
Message-ID: <39659fd3a9c75c8ad1653c2ef34049b94595170b.camel@aosc.io>
Subject: Re: [PATCH 1/4] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
From: Icenowy Zheng <icenowy@aosc.io>
To: Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, 
	Chen-Yu Tsai
	 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard
	 <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
In-Reply-To: <9ae7d1ee-4e2d-f3c1-f55f-e96b0e449b63@sholland.org>
References: <20220422155639.1071645-1-icenowy@outlook.com>
	 <BYAPR20MB2472E8B10BFEF75E7950BBC0BCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
	 <9ae7d1ee-4e2d-f3c1-f55f-e96b0e449b63@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 23 Apr 2022 08:10:31 +0800
User-Agent: Evolution 3.40.4 
Content-Transfer-Encoding: 8bit

在 2022-04-22星期五的 18:49 -0500，Samuel Holland写道：
> On 4/22/22 10:56 AM, icenowy@outlook.com wrote:
> > From: Icenowy Zheng <icenowy@aosc.io>
> > 
> > Allwinner R329 SPI has two controllers, and the second one has
> > helper
> > functions for MIPI-DBI Type C.
> > 
> > Add compatible strings for these controllers
> > 
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > ---
> >  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        |
> > 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-
> > a31-spi.yaml
> > b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-
> > spi.yaml
> > index ca4c95345a49..6354635241fc 100644
> > --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-
> > spi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-
> > spi.yaml
> > @@ -21,6 +21,8 @@ properties:
> >      oneOf:
> >        - const: allwinner,sun6i-a31-spi
> >        - const: allwinner,sun8i-h3-spi
> > +      - const: allwinner,sun50i-r329-spi
> > +      - const: allwinner,sun50i-r329-spi-dbi
> 
> As far as I'm aware, the SPI portion of the DBI controller is
> register-compatible with the regular SPI controller. So I would
> expect using
> that as a fallback compatible for the DBI variant.

This sounds reasonable.

> 
> Regards,
> Samuel
> 
> >        - items:
> >            - enum:
> >                - allwinner,sun8i-r40-spi
> > 
> 


