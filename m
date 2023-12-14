Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A97634
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 00:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAF2EC15;
	Wed, 13 Dec 2023 16:59:07 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 685E73F762;
	Wed, 13 Dec 2023 16:58:20 -0800 (PST)
Date: Thu, 14 Dec 2023 00:58:10 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add Transpeed
Message-ID: <20231214005810.7b0318c6@minigeek.lan>
In-Reply-To: <cb28ca67-8648-4199-92d0-e3129277b624@linaro.org>
References: <20231212010859.11571-1-andre.przywara@arm.com>
	<20231212010859.11571-2-andre.przywara@arm.com>
	<cb28ca67-8648-4199-92d0-e3129277b624@linaro.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Dec 2023 10:01:25 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 12/12/2023 02:08, Andre Przywara wrote:
> > This is a name used by some Chinese TV boxes, add it to the bindings.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 309b94c328c84..d9dd3f929cdcf 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1438,6 +1438,8 @@ patternProperties:
> >      description: Traverse Technologies Australia Pty Ltd
> >    "^tronfy,.*":
> >      description: Tronfy
> > +  "^transpeed,.*":
> > +    description: Transpeed  
> 
> Please keep alphabetical order.

Argh, sorry, managed indeed to mess up this super simple patch!

Will fix it, thanks for having a look and spotting this!

Cheers,
Andre

> Best regards,
> Krzysztof
> 
> 

