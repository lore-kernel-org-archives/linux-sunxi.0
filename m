Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACBA3232
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 09:02:52 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNsTH-0002ls-7s; Tue, 16 Aug 2022 11:02:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add Allwinner D1 board compatibles
Date: Tue, 16 Aug 2022 11:02:46 +0200
Message-ID: <5849253.UjTJXf6HLC@diego>
In-Reply-To: <1f84e925-1a0f-6100-c444-a8157e14ab5a@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-5-samuel@sholland.org> <1f84e925-1a0f-6100-c444-a8157e14ab5a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 16. August 2022, 09:39:38 CEST schrieb Krzysztof Kozlowski:
> On 15/08/2022 08:08, Samuel Holland wrote:
> > Several SoMs and boards are available that feature the Allwinner D1 SoC.
> > Document their compatible strings.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > 
> >  .../devicetree/bindings/riscv/sunxi.yaml      | 64 +++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/sunxi.yaml b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> > new file mode 100644
> > index 000000000000..564a89499894
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/sunxi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner RISC-V SoC-based boards
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +  - Samuel Holland <samuel@sholland.org>
> > +
> > +description:
> > +  Allwinner RISC-V SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: Dongshan Nezha STU SoM
> > +        items:
> > +          - const: 100ask,dongshan-nezha-stu
> > +          - const: allwinner,sun20i-d1
> > +
> > +      - description: D1 Nezha board
> > +        items:
> > +          - const: allwinner,d1-nezha
> 
> You grow the list unnecessary. Several entries should be an enum, unless
> platform maintainer insists on such approach for all Allwinner Riscv
> platforms. Just be aware it will grow...

Having the binding document provide value to mere mortals and not only
the automated tools is plus for me :-) . So obviously personally I like
the current style more. But yeah, it's mainly a matter of preference :-) .


