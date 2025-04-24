Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8ADDC1
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745522156; cv=none; b=EGXNrAq6IUY2heN1PpdRl0yrRtzL0JUQnW29Nz1SOuFxm0zxdfcJ0RYl3P07gHR4a5mbu9G+s4MxvqITp/YpYVtAZfx8F1rkYyXQJtx+jNyccZ7JqO9yFuxPowjapaxp8sa8cYBRpMokFvD+2p5QzQ7PblZz4KlR/oPBYG716U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745522156; c=relaxed/simple;
	bh=xaX9GfEYK9n44mlY1Zl6aj7j0/jFobvrb6dPwXaxJfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baIYUbkXu4Eln22hfl4/Pv0X1en4WNSuieItWJBzMSPhGSwNdDf5g2DnaveSFu4m6wbdkLwigTkYKao+HgauBT0u2Co7WnGETKe/dAfTxKRC0Dcck91T3EKVU3jCrSkeTQfu8kj+ovtmo3Pn6In1gYN+Slm4hcMEoEm/UolEWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCxBn8dj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCxBn8dj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1058173f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 12:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745522152; x=1746126952; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fg/5CSYGx8pustO7TFATB5SoThu17c6gLk2jPxapenA=;
        b=dCxBn8djKzDrKwukrRS1pRoKPUn5E5O7OEe26+mixLAwDYHs7GGnri/47fQK1/qjvI
         WxXBM/vFmpd12nIO9u3BglAlo0ksWFkejTZj9DZ66SF071RLwCtL03oJQHteKTO9S9MT
         6X8vXS573fHraNCTtKLQSdoUuGmxNcpNoDcJqCuHnY1nHZgjShXLYJDLlO4VazGYp4bn
         e7JuP/PVwdnv+QcVSlz1PaH+wOpNW3xVqOzl7Tz/nD0DkzLOnlz+VgGd3nDmwqxKosHk
         jsfSFKjyggzDvu4ufll/J8FuHILSuPCe+8MiK40Oe9HWX5zWDLDdpeIpkWfqqPuQuco1
         Ox+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522152; x=1746126952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fg/5CSYGx8pustO7TFATB5SoThu17c6gLk2jPxapenA=;
        b=r0NgJDpfoNMIDHVtCe4sptNlcaIVHvEFkgOobozaaGvzXwT15X+jRrEL4TnlCYez8U
         8IRrQag3+fHOL2tMLt5YEx0tGedZzLBL8iUL1NTqsBiF/kLNv6bwlGZGH+oi0/b+08UT
         4N4DHPBAztBb1kLI2+t5YPe3UM8jfiyE0ra4E3Xne/wvHbZ24MDA4niakuZG0xevpvrd
         VXLQNw6pEhi1K5uusQ6Fn3wiNXLMgUG0Fh8IwU5+GB7/kO+XswN7OEIp4mxvdUezwX3p
         8I7JZ7Xj0AR4nmuCuN64ujQbxjHAN/8+wnfzS3imKichNa2mfk/kcq9Isk79I+B+5rO9
         rZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXrhXcOeZUcrMnUpTv8mgLsEAo08R6NNpsL4HU4YNiiuLlwQyXsMyO962BrndOQS87w6OIrNBvOotqKOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxunH/uQ1PN8zTcEGaEWimm7n/xh23K8Jt3yXpcMLwGY//0DqWn
	5qHBqkImI1SvlzURz3uRB3vTUCIvOwEK4TlrRlwbgfaYfK2HJ+y4
X-Gm-Gg: ASbGncsVM3tfFCocJ1VGFHIV5G7YTZgrNYMbWTG7dSZ9+pzQSL+edWWsbvM6kLLAWuR
	Ijn1mmCfMDMflEPup/KR9XGaqYLQ4ghD9229NitFLC95fjJit5r+uqkprvdKU51hAgKaUrGfVSp
	a08kVtE6tQ4ATTxrs4VEUUD18aiDEVqNk66EzY5lAlkuCiVSb4N4Z+HJRJKQ0G/ITUxDsHKP8tp
	ILyGRbXLzFckVOYV5F8D2BVSpnmQ2NAJmeWGLva9LwZADbDgs79JEdxevdB+YzuU5bT5zDZc3zy
	v9wK+U3nJij+6lCyT0waMq4Dt0+lQYvwDPsiNRz08iBDRtpnPWHJ
X-Google-Smtp-Source: AGHT+IGDtJkWxzHCs3qBzGx1s0jq+yB7NCM4c9k0cZ/pHOBdBV+p+7aYjAospsSGtI/LXj666TeSig==
X-Received: by 2002:a05:6000:1ac6:b0:390:f6aa:4e80 with SMTP id ffacd0b85a97d-3a06cfb24abmr3545024f8f.53.1745522152219;
        Thu, 24 Apr 2025 12:15:52 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca99sm161810f8f.20.2025.04.24.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:15:51 -0700 (PDT)
Date: Thu, 24 Apr 2025 21:15:49 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa
 A5E board
Message-ID: <aAqN5cKdDr_D10LX@Red>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-4-833f04d23e1d@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-01-sun55i-emac0-v2-4-833f04d23e1d@gentoo.org>

Le Thu, Apr 24, 2025 at 06:08:42PM +0800, Yixun Lan a écrit :
> On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
> which features a 25MHz crystal, and using PH8 pin as PHY reset.
> 
> Tested on A5E board with schematic V1.20.
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
