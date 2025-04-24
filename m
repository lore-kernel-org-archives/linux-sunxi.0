Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5DD290BCA
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745522255; cv=none; b=UduZ7kVBf6VOqiaY5yPPM+OKLSXDl9Sak58ra6C9f1E4C/nviO5u+QgdLQ1QU/io4zmFgplWoZNQ7qw85KOtWSjYdgRCfjjIR1j5Phaonw67g6pbkXWPetWIOXW/U3NGxsqeZg3X6jFYIQLN8D2RUKl+mcMZ3toXeFQkLCmDcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745522255; c=relaxed/simple;
	bh=4FAg9dOCib/NxKAtEqDq/2c3ne9EVt+MCqwoJUr75Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWhycHY4vPmFTLJKiHtQ+vm3Xax6eWYxA3AQGmBe/CJsYKtP6DlbWbcFNzI4TM2jWfPznnkXkW4b7qYgjtxRY9UiBb4n/8olKyGvvxcOxv+wSwPCwmrqLHZOOBVrREWCVV6OVPwG2eY0ooOYLTG9wpGImCbiKBkbSsR+QygUuKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cev+LDig; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cev+LDig"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso9023405e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745522252; x=1746127052; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hKtiIR8/1ANFiI3jvmxK88n9ocUCdqWIViGNXRe9MXE=;
        b=cev+LDigdhutchZNRWHHG9XrqI4PlhRxsi9ZC3yc3bMo6KKUSvnr07+ZlDkl/WFVLb
         4vaDThuAtIXxP1LX8WDR3PWAmpJ53exCo8YesNnJhVqP7qjC/q7vv1eTRVwJ0NTwMPie
         gr248uyPiyCclbxN8ruaarNkMdPgs2DfOk/PGlLh13TtzUMJlYzK2RhxtJdpNVqzT5mB
         UkyUNt12r2QtF1++mKiimP8QW8da3nFLKrm4yjB0pBiXn9W6PrQEJ7/GvTchEsixP+9s
         nefc3DGBixM3OEtx5r2aeW885x2vfoF5jnk4vKFqgoYWNaAeGGgBmDiROjadj9KN6k3E
         CchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522252; x=1746127052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKtiIR8/1ANFiI3jvmxK88n9ocUCdqWIViGNXRe9MXE=;
        b=Q1y4WMdFtpvqu19LU7HI2iCjEikjPeN5Igmp7ClDGajCNvj4IWJiNP0ySGBv/79JGU
         L5PviPhZtFU9FrCUIj2ReFeKlRk4nTSI8NvFv5P5On7vfffWGi+liR/iG2myXHxKpxyt
         RrzqB7CJ/AC3I/hCAZY5wtflGp3KqIN5eFHuRSUPaDSJ9uInkKzP0gHjKCZVgH7Lgne4
         jqi5qKsfGVDYoRQxUKHUN2pgl49TuoVrJ8Sn/PZMs5ZGkKZaDrtjCydVrJdUoAX4lynb
         nDNkrasazQrhROMOkH+wSyNCYBGACObTGBUhv20+398ohtrdLInovuxXyRGIOKKgKN6Q
         BmKw==
X-Forwarded-Encrypted: i=1; AJvYcCXEFzBuKCTrMCgf8ELUU3I4zPERUfVwLfWpPnl6va9dwEoTcM331gVnlwemXafCexunybM9449/bUgAEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhNfemXvc687/PC/KIRutrS+pOcHtes9Voj2ywyVbpDpRLI1ge
	KYtxFzqlcWNJfPwX8srLHlGs6Q8mVoEjXGZhYzGGn3K5q3Xs5DCo
X-Gm-Gg: ASbGncv8mog2v5KhNxZD/d5ZWIX6fFRTI++FCsFf8I4TJ+vR976Foso5P+osbqNiqHA
	7lbB0CAXWnNnuuP6jqYOjSG6QloCSKRWcopAauytWbXX9NjmUAwI1zNqf0dHNM6pXYYI+VJywmp
	wIRoquvX5/dLYvSe3PsBb+v6mOuFgHQOzwnXqwJIz8ngx7OEceJ93YtRmPFcINmnrvUypY4bFAq
	m7QUjNxbzNAi6iY03DQ6Zsc0uK9oUeuCg7idbQJcEQvJhpaeijkUmThd/vICuxl97umbTeBcFue
	vrWJX6ToMX2D4+7F7fokUuGe/I6UYTtLJm8X/QXB
X-Google-Smtp-Source: AGHT+IGHUagr5uQkmxlICqpS4xt1BsRnNl8Y/nS1PqKVhK6DbPifS1o99SIUo9WiHCLLy1FyDQtZ4g==
X-Received: by 2002:a5d:64ef:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-3a072a4636dmr351698f8f.4.1745522252237;
        Thu, 24 Apr 2025 12:17:32 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073cbedc4sm156237f8f.47.2025.04.24.12.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:17:31 -0700 (PDT)
Date: Thu, 24 Apr 2025 21:17:29 +0200
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
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet
 MAC
Message-ID: <aAqOSRQCKNuezyUK@Red>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>

Le Thu, Apr 24, 2025 at 06:08:41PM +0800, Yixun Lan a écrit :
> Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> including the A527/T527 chips. MAC0 is compatible to the A64 chip which
> requires an external PHY. This patch only add RGMII pins for now.
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
