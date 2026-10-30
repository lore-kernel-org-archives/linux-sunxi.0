Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363087;
	b=3yKneJGa/NvIqWIDVAbAuIrIDIn0Gma5J9c6RVHNjZYgcANL4DFYlLTfKvNpA8NIXXz5
	 gChQPndr1wrZ/qXq4TADULo6LIzNtHuzDvzdBmqgXI/azOP7kF9fY8dox4q1RU6yh8ZjU
	 oEE7G2sJDjDtln9d1yqiYPwPh/PhdNWa/27K9rIxUMBC3+B5mKfOuzATI2rcfZWDbf7u8
	 K1Cs62uSS91KB8kUdDtdXu3gLUUmiJAJKVwhDhJFydLS5NExYKr6H+CtU1Wq9njRV0RCD
	 whYcaIqdlC+yiBmsagRwVffnJSDGZAZqzrpdyDnPRE2E00qDWiNk1tOxorg1gb8EQ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
	b=cbGYPsCeFwyBEtspMayDkGxmP5c2GwB4CLnZwcNKBdCQbqXqPg7WIcuygk3lYRtOOl5q
	 rCabV3ygfZ2WCURKN0Z8ZeiIAm0vI9FELlrDBwZkGQsIlcWuV0PXFkrMOtmTtOk+5tzdF
	 lmlDEaCIU40K0FZVxlw/w8nOTtOIbPSQB/4xOt+2L7mkPH7jkwyqLQKM70jhsuAXKJV+c
	 PGADHT0104PHk5zcjn6Y5Ayot+1u48UyHZdCckLisOUkbzTdhH2AZ+m/5nslbsz8fl1/L
	 0KyMPCefrh+4pJkhUtOfioyiQvHJ/+vyU1mJmtte0mQmqAmg5jPUbQg0z0SHrVBPdGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9X+c7+o;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C44606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 12:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C44606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9X+c7+o
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9906870a9baso343909241.0
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363085; x=1793967885; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=Z9X+c7+ogClRKbqxbT6jXSkDHVAC+xjWrG0p4XPNoCta/sXTsE7Wl/J4bmv7iN51gt
         ji8lxNqigdx3nVqn8B72NhCHrk3bdbaTcrBJzLorwfH9+Fr/06BGBJG74jl5epp2zsCH
         y55pntTkogxVeYiyaUecu2ySumVCnKqx++VV7EmnipZKmMWF3gh5LcBeBy3vNZUryHf4
         RuJLZt1rPBxL6uYpESn1TBeClR5UByrKh9XN3sRN/khyTPqxkCBzlvOx/OUPZxjGwpD1
         6d6Wr3CepuUL6iBvm/+/lBFk+bXS13nPI8yb5PfXVKJ8xmozKgLvxK2Fc0zvtwWn133T
         CMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363085; x=1793967885;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=CQZvPqxTn41WxRdtO8cpGbfHIwnpeX7wO93fpRGneTW5P5mzzJSoJ0hnpuziJQeCYM
         DHryyFNkaRIFTbGuSmylduKyvpaEG66F8NvI7Em0e/H0xRtJ8oIBeMEiaC9//Faf3D+t
         zF1rK0Bn5qwCDtwVoOaeEjV4wgS6G4WECMrKDbTUf5Ts42+MHaFsyTKIdio5IVJOg7EU
         xbg291B8+A43JjYbmE4UpB4ZnrJrBcP+xGruxS9e+7oX3fwsG2Giuc6s19X53IfA45uu
         z3Vi5RY6fN+NZKrZGRxoR0ywo8gau2YMO+0Fxo+90xe19AnG2T6m5zo/WsrYcSLRR7iV
         mWfw==
X-Forwarded-Encrypted: i=1; AKwUvBypC2M2xzv7qC4CznAVCiEoEN9GNYkF51d/rM5MlDEHdQ2ofWqeF1VLMaCdYO7U68s4McMwrQFn3A3DSQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJZIqprtkQhwOX1C5W0EV64KB00gk3F1elBpsglkIEJEyOuhjbL
	7eaklEnMwIMs7h6ML2loIb2EyZRTIAHfxiCwani5Te21oStp1ixlzigd
X-Gm-Gg: AYBFou0oCvIe+QI7u8VklbMjDce1h/0ssRIi6IfOnHp3R97s4VssWsQuEKxN/Pdp2DJ
	V6cdRCCtx4WsikG9gHjjRh6o+mbHA13VlEDMoKDzUMTlxHYf5ZoNL5KhUl2WlKIwmBbO45FN6Bj
	asbSJcgrkzN7OGGi02TlvOYSTjtUFwqZQ5/HOY6/mO90p0QI3ma7IxFZrTUGoqIZW2xN7+laxd1
	cOfTklXTNcblvzpm/vuWTOI5qkkaR4Xid7YS9ax2jHNm+9TSLTGkTstvojoZV/ty2/Q42TWMnZn
	rEWvMmEZWwKx1ERjzntofWNRH2GAccaA2SKqpmMF/P9VtLm6y2gYblNj9asdjiaoh1hiqO3Hg7a
	0Ssg/Bs7ZrRyRs+gnKa7NczpwmG28vxXEC3UNGE2SETR98qiJXo+EBVrBKEZpuRckzJqWZetxO7
	qLZz34oJX+gYRIVGFqqxhZUZTBg3U8xXRpLoKV6rnDyrvfmJELcoF+JaXp/NoZjCySYENadB+fg
	ZO6sr/7ogHmkijJZeTxXt2BAjXajIHNt4Vwd2s6rX3kT2lwYs3+0QSYeAKoVHbwkEcl22sQZtF+
	ds+aGF1OVgiQr4cgInU4XLkBCYcMZl+eYRyrTcN6b5HqXKGSjtd6LuNFKpa2sAEYEgzZdpOHclJ
	3oTObabVIIbcWjQ37GNJ/vyE8UNxhoUd9qc2W
X-Received: by 2002:a67:e70e:0:b0:7c1:7ca9:94bf with SMTP id ada2fe7eead31-7d072c3fbc2mr1028237137.19.1793363085481;
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf54casm2188412e0c.9.2026.10.30.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Fri, 30 Oct 2026 09:24:33 -0300
Message-ID: <20261030122433.1659882-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030-adaptable-vagabond-skylark-bacc90@quoll>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com> <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com> <20261030-adaptable-vagabond-skylark-bacc90@quoll>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On Fri, Oct 30, 2026 at 01:03:31PM +0100, Krzysztof Kozlowski wrote:
> Just one paragrap and explain whether they are compatible or not.

Yes, the A733 PHY works with the D1 configuration in sun4i-usb, which
is why I used the D1 fallback. The A733-specific compatible lets the
driver clear SIDDQ earlier, which made intermittent USB1 enumeration
failures go away on my board. It doesn't need a different PHY
configuration.

I'll make this clearer in a single paragraph in v2.

Thanks,
Vinicius
