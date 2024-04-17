Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020352207A
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713347687; cv=none; b=fjmHlpWMiHkAAgCiV8dWHQfUQq5M9to9BmRBrFMgKUMmkc6tlVcu1EIFGNe2OAkeU2oNP2gyXZMWGw57G71vG97DH4A1+gTH33hO1+5iPqLY0dQ3721F18h7O47kMqv7Xv2KBetD+VqcstW0P2RFWRw4pajqOyS92hIDwWX/67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713347687; c=relaxed/simple;
	bh=wxzAIZCsb6qYmZgvaeV7YE0JgPMqgrPF11FYAWXhCV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fcKKsTF7PvqqMk7Ekj5BC4JO09RavFlWbui1znOgSpWYzO+mhqqrTIOoTdg6PCQNfXT9Ur5dCXEvy4o5LvtRSCbhTYG8dFDyW2rD1F18iO7bR8JfN1yG5M1MNKPpyFyz1Rg9AP7Hq1gmdWhvOV17pENUO7i9IOaIVUrssFytsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C76C339;
	Wed, 17 Apr 2024 02:55:12 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251963F64C;
	Wed, 17 Apr 2024 02:54:43 -0700 (PDT)
Date: Wed, 17 Apr 2024 10:54:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX
 handheld gaming device variants
Message-ID: <20240417105439.2674be75@donnerap.manchester.arm.com>
In-Reply-To: <78b5de01-150e-4537-b6a6-8ca0067a8359@linaro.org>
References: <20240414083347.131724-2-ryan@testtoast.com>
	<20240414083347.131724-3-ryan@testtoast.com>
	<78b5de01-150e-4537-b6a6-8ca0067a8359@linaro.org>
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

On Sun, 14 Apr 2024 11:07:19 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi Krzysztof,

> On 14/04/2024 10:33, Ryan Walklin wrote:
> > From: Ryan Walklin <ryan@testtoast.com>
> > 
> > RG35XX 2024: Base version with Allwinner H700
> > RG35XX Plus: Adds Wifi/BT
> > RG35XX H: Adds second USB port and analog sticks to -Plus in horizontal
> >           altered form factor,
> > 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > ---
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > index 09d835db6db5..fc10f54561c9 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -56,6 +56,21 @@ properties:
> >            - const: anbernic,rg-nano
> >            - const: allwinner,sun8i-v3s
> >  
> > +      - description: Anbernic RG35XX (2024)
> > +      - items:
> > +          - const: anbernic,rg35xx-2024
> > +          - const: allwinner,sun50i-h700
> > +
> > +      - description: Anbernic RG35XX Plus
> > +      - items:
> > +          - const: anbernic,rg35xx-plus
> > +          - const: allwinner,sun50i-h700
> > +
> > +      - description: Anbernic RG35XX H
> > +      - items:
> > +          - const: anbernic,rg35xx-h  
> 
> Any reason these are not just one enum with three entires?

I think the policy in *this* file is one entry for each device, so that we
can attribute a device name ("Anbernic RG35XX H") to the compatible string.
I mean otherwise we could group all H616 boards for instance into one
entry. Don't know if this is what we want?

Cheers,
Andre

