Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A66F26A1A0
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843495; cv=none; b=ewVxAR1/RtV0SkhffTAPEad1XLlRzUwBYdaV8gVeJHvCcaXIBz/2+B131w4Fn9A35nyX0v09U4daizJP2u4pCfp+HrZqSmGdILRd4/oWykWRqxcekclZc8N5FINc29RzS84xfVvNkoy4zmYObBShRjc7qrR6bjLzprBsPDaNmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843495; c=relaxed/simple;
	bh=gwBWdi3DsQDSGAcw91QNj4uRRTHDHP7U6CL+tA4Yvgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKLng3v02Pp9n+PrEo00otaTVoA5E7Glva6jBcasl1bAdKFHcMPZB5capwJ/CcvPaDkfDTd3VEdE3xXsnB0wkNe4+98qlMigmuFHfEohGC/+5fNKxmY9/KCcjO2Yh8VNLXI0/+5Ts5NV6VK7sstISCQ2pY/NwD1jHF2fpwHAN2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DB59234306D;
	Mon, 28 Apr 2025 12:31:31 +0000 (UTC)
Date: Mon, 28 Apr 2025 12:31:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
Message-ID: <20250428123127-GYB56330@gentoo>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
 <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>

Hi All,

On 13:43 Sun 27 Apr     , Chen-Yu Tsai wrote:
> On Thu, Apr 24, 2025 at 6:09 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Allwinner A523 SoC variant (A527/T527) contains an "EMAC0" Ethernet
> > MAC compatible to the A64 version.
> 
> The patch subject prefix should be "dt-bindings: net: sun8i-emac: ".
> 
Ok, I can update in next version

> And this needs an Ack from the DT binding maintainers.
> 
I'd assume Krzysztof Kozlowski also fine to have his ack kept in next version
with above subject updated, since I saw he already gave an ack to this patch.

Thanks

Yixun Lan

> ChenYu
> 
> 
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> > index 7fe0352dff0f8d74a08f3f6aac5450ad685e6a08..7b6a2fde8175353621367c8d8f7a956e4aac7177 100644
> > --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> > +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> > @@ -23,6 +23,7 @@ properties:
> >                - allwinner,sun20i-d1-emac
> >                - allwinner,sun50i-h6-emac
> >                - allwinner,sun50i-h616-emac0
> > +              - allwinner,sun55i-a523-emac0
> >            - const: allwinner,sun50i-a64-emac
> >
> >    reg:
> >
> > --
> > 2.49.0
> >
> >
