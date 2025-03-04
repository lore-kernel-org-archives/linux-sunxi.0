Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948E51FECAD
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Mar 2025 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084619; cv=none; b=UhF7MbHhbzScx6gp+dBQaiNvGdmH6hLHE1zjErKEAvDqk8/eICPp36ruxRBsDAgXzlMqgTB6A/RRFJ8JNJHYcm2SKJcYMeQ61HpzJW4AlfesZoMKQexz0MQU97k3x3IVEsk2fqg0WeEOB5vSAGpg2AbukbeO6Hsth6IHZzY2urQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084619; c=relaxed/simple;
	bh=BmEMnUQazYWnIZvlMgVe+B+0gK3c+s4Wul/qIhUAqyw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tv6RDh7aAoCCyzh1sz66CmizzQUXjjmf89JuORcIIVg7id4XhmsmB30CdG0jn8qWrQqNVsj7F4Mv7bVwtWDy2MNwOOA0P8Je31tdAUCAjiL2Dlndr0qbEKntkxKCh2IUsyb7VOrQ5lb45uD/apkA6PonjwJJRiPvBTn8pjtZrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A01C3FEC;
	Tue,  4 Mar 2025 02:37:09 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01D2B3F5A1;
	Tue,  4 Mar 2025 02:36:53 -0800 (PST)
Date: Tue, 4 Mar 2025 10:36:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] dt-bindings: clk: sunxi-ng: document Allwinner
 A523 CCU
Message-ID: <20250304103650.704fd28b@donnerap.manchester.arm.com>
In-Reply-To: <20250304-resilient-spiritual-crane-30d4e1@krzk-bin>
References: <20250304012805.28594-1-andre.przywara@arm.com>
	<20250304012805.28594-5-andre.przywara@arm.com>
	<20250304-resilient-spiritual-crane-30d4e1@krzk-bin>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Mar 2025 09:25:24 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

Hi,

> On Tue, Mar 04, 2025 at 01:27:54AM +0000, Andre Przywara wrote:
> > The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> > the main CCU.
> > 
> > The source clock list differs in some annoying details, and folding this
> > into the existing Allwinner CCU clock binding document gets quite
> > unwieldy, so create a new document for these CCUs.
> > Add the new compatible string, along with the required input clock
> > lists. This conditionally describes the input clock list, to make for
> > an easier patch adding the other CCUs.
> > 
> > Also add the DT binding headers, listing all the clocks with their ID
> > numbers.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../clock/allwinner,sun55i-a523-ccu.yaml      |  77 +++++++
> >  include/dt-bindings/clock/sun55i-a523-ccu.h   | 189 ++++++++++++++++++
> >  include/dt-bindings/reset/sun55i-a523-ccu.h   |  88 ++++++++
> >  3 files changed, 354 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> >  create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
> >  create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > new file mode 100644
> > index 0000000000000..2eacaeaeabac7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A523 Clock Control Unit
> > +
> > +maintainers:
> > +  - Andre Przywara <andre.przywara@arm.com>
> > +
> > +properties:
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun55i-a523-ccu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 4  
> 
> Drop, redundant.
> 
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    minItems: 4
> > +    maxItems: 4  
> 
> Drop both and instead you need to list the items.

> 
> > +
> > +required:
> > +  - "#clock-cells"
> > +  - "#reset-cells"
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +if:  
> 
> Drop, you have here only one device, no need for if:then.

I know, and I do understand the redundancy of the minItems/maxItems above,
but as I wrote in the commit message, this paves the way for the follow up
patch and makes both more readable.
Apart from helping with the review, I didn't want to conflate both devices
into one patch, I think I saw people complaining about that in the past.

If you are fine with having them both added all in one go, I am happy to
just squash the patches.

Cheers,
Andre

> 
> Best regards,
> Krzysztof
> 

