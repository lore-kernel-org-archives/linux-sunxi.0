Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC851A3BCD;
	Thu,  1 Aug 2024 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722529525; cv=none; b=i36yGWP0OkyXxUsA3wzDsvkyJZLgMOjP8UZkXK8q3BeIKog3Fc5jXo4Ra+FmMwbN29yyt71FqyH1jK9d0SSutXuS40IqCTVF2wVr6ELTnbY1gj+1PnE347xhiBl0gcXhq8a5+g2vFbdAxgQmAFnlShxxmwFOqJP8juVssjqpUk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722529525; c=relaxed/simple;
	bh=ThfdeTM6wFvy2q7jTkVEJ1r/5dq9SB0sJlJsNVa3fxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I/S2zjeAkRRBu+dRtVblkd2GdFw/yGyOWTG9Q7Q1QU6deIEwXK8wLoVOgGS9qqGC19YJW348N58741I78fKpChTs2IDqGNZthBmQqCgYlJRpc3uNYLmy9O07Pwsj1YL6SEG1v1F4gspiauCqHbNrHWaErqIeBOnqQDEgNaSjUpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAD9C32786;
	Thu,  1 Aug 2024 16:25:24 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id A097F5FA26;
	Fri,  2 Aug 2024 00:25:22 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, ryan@testtoast.com, 
 andre.przywara@arm.com, samuel@sholland.org, jernej.skrabec@gmail.com, 
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20240710231718.106894-1-macroalpha82@gmail.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
Subject: Re: [PATCH V3 0/4] Add Anbernic RG35XX-SP
Message-Id: <172252952262.1669767.7675865282122079154.b4-ty@csie.org>
Date: Fri, 02 Aug 2024 00:25:22 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 10 Jul 2024 18:17:14 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG35XX-SP handheld gaming device. The
> Anbernic RG35XX-SP is a clamshell device, but hardware wise is very
> similar to the RG35XX-Plus. The RG35XX-SP has a lid-switch and an
> external RTC that necessitate a distinct device tree.
> 
> [...]

Applied to sunxi/for-next in sunxi/linux.git, thanks!

[1/4] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
      https://git.kernel.org/sunxi/linux/c/dbd52a3a0669
[2/4] arm64: dts: allwinner: h616: Add r_i2c pinctrl nodes
      https://git.kernel.org/sunxi/linux/c/7c9ea4ab7617
[3/4] arm64: dts: allwinner: h616: Change RG35XX Series from r_rsb to r_i2c
      https://git.kernel.org/sunxi/linux/c/c712e5d09856
[4/4] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
      https://git.kernel.org/sunxi/linux/c/2873085a8cd5

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

