Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539369;
	b=GPqi3U/8d9Q9hF2946eNVQXMfsopc9cFSRBNSAb3B/4/JikeNadrWojXj6o+bGT78v4P
	 91p+jtIkvp8+uHJ7/FtWc6NKutYQ+XCo4CbzqhzlFmytazkSE5tGRLRxTeakMYX0c0yXF
	 +0wlwfZs5UnKT7MbZBhgsL7HLkJnoZxUdtHoTLJz4RKleiGfFG8jrbml+ssCEoQ2gSFzD
	 yxznd4CW8P2oOu+KcXNlXymX+LP8+rMmVn5CRatrVqWSacBYPlv6KN8HliTcLZH826spX
	 mPISmq0Ji0x2Y4FR0U78zYjIozfxYv9XeO8V+C4hoNK3lJqyTWMQeYm0s5TjWcfrjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539369;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=6rogdOocEwNLZf4ag958lfiyvWWO3bMcbTKmrC9iGKU=;
	b=ZNR83y6Zjk7zUQZ/PcH/zBHsZu21WzcVyZP7SMgddd5X4A8ChnxFKXGr08OoeG3CGYVS
	 3a334Qn1yaHVl71ee+VRkh7xW4qAQF21AyR3Q65/n+l/A8CXJ0zBggNoC2FLYMzF9/c4f
	 ATtkOVvq0YElr43JnumK+0jTR0YegMQEwKBQrEsylwJQC86OmuxfTqEffGflFI5ARNH+u
	 GVwHmDnEPZvINHytwN4zkr+/s/Tqjfx7Ii4Rdq23cxeAfKuo6pgDAXqsz+iBH/+75b1+d
	 YGn5vd9qDUhMtemXyOu/LDC1qUsSQ1NNuDVkg2r3liJp0Riz3bsqgG2+Xlt+L5ZkAJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XI/jS4E0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9EC606A33A;
	Tue, 24 Nov 2026 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XI/jS4E0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69EA1F000D0;
	Tue, 24 Nov 2026 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539368;
	bh=6rogdOocEwNLZf4ag958lfiyvWWO3bMcbTKmrC9iGKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XI/jS4E0PQIJ1iAUEt8UTQOcabXi79J22DUYKSGWINJKKQmg1z1nxiNxc7MqIzvpU
	 /mOre7/hK44PjEXd5P+o1lE8EkskZgsBfhRfBSnQWG2T8YNrrwYCLFKm4rIiTUajUJ
	 EqCr1HT2u+4M4FptPq14nPHyJfdJ3vnzUHqNei/SBr3YzFetqa8Gny9w+ELb6l/Wa/
	 A4E4x+TI8Yv0Ul7ixF/YCRd+I7IGskTM931dgJIF8dlKxOrfvaUx5jiRe+LrSLJvJR
	 GTDRD8FJ932gDb4SSVU4KVc91Zr8tQc2+6PFtVijAiQAnX+WegEEwixo41VHZcbZYz
	 WrrhK+0bTr8Eg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20261101100000.725282-1-amadeus@jmu.edu.cn>
References: <20261101100000.725282-1-amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 1/1] arm64: dts: allwinner: a523: drop redundant
 status=okay
Message-Id: <179553936644.1403078.18380005344784307573.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:06 +0800
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 01 Nov 2026 18:00:00 +0800, Chukun Pan wrote:
> Device nodes are enabled by default, so no need for
> status="okay" property.
> 
> 

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a523: drop redundant status=okay
      https://git.kernel.org/sunxi/linux/c/b1ec3dde5185

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

