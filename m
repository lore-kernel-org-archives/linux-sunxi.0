Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C82144C8;
	Wed, 19 Feb 2025 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740006670; cv=none; b=PZyyf3fO2fgtSyBBz/szG0QN5J0nYHwXgvL4B6NM/cQ/Uy16UIkOsfnVSQzu3O5uKMaL4b1ui3IsxMwW8zVS+5abBLhEc8csaVXTFxWg2rmrcLKBjZepPiTCWRE2OgljaiBPKOvZPufQcBstTrAIq9cvc7r4KvT1IPZqIrkqwuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740006670; c=relaxed/simple;
	bh=EGlWTDM/xU5sb1Qa92jq7OnxARIjGZpdIKyoEfe4RK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4Vz18Vh55UNyaMpdc/ogi2mar7TBJpvcsf8MAcYxWi14valzpBtc+dI0YXjfrsT7SEQX6bTWzulm2OEZF8YWFAS9+Q3QiX6tOIHTh/UyLf4dqSFwYMMcawnnE2COXNIC79CNIcYYFpjXqb+6Umtkkrcd9gYQx8JcrciaGMfkhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnAmaDmz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnAmaDmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E1FC4CED1;
	Wed, 19 Feb 2025 23:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006670;
	bh=EGlWTDM/xU5sb1Qa92jq7OnxARIjGZpdIKyoEfe4RK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnAmaDmz2k2RnZD4YVcRH5gn4OiCV1pkDySn13421Z9PDrP6AphTLVsO1XMxD7h6a
	 JAFKVKcdcSdvOgFjiX44qzB00YdYLzzuDhC0WlbxnN1lvjPE+L8g/kqkPkPegjpirR
	 BzJlMvRt99ymBfwDpLz76HBx4xvuBcCA8fa3z7Cn6n/P2aLoFfgIJiba38/mg2PpKl
	 l0G0ZxHZ0P3x7NFc6Y8+z9MAewXZZdCJPQyYEu7fRhWdTRRepxYZ8Yza5DIj73w1iN
	 w8bnT018WicR3PcT99Il4r3JIIeU5I4Qijr48/bxCvfT9Ctvla1+00YzcRYKzoH3qD
	 PB+C/l9rEB2JA==
Date: Wed, 19 Feb 2025 17:11:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 3/8] dt-bindings: allwinner: Add TCON_TOP and TCON_LCD
 clock/reset defines
Message-ID: <174000666818.3147824.9907877642001632634.robh@kernel.org>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-4-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216092827.15444-4-ryan@testtoast.com>


On Sun, 16 Feb 2025 22:27:10 +1300, Ryan Walklin wrote:
> The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
> connector. This requires additional clocks for the TCON_TOP and clock
> and resets for the TCON_LCD LCD controllers to be defined as per the
> T507 datasheet (which shares the same die).
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

