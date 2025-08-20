Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FDA23643E
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709345; cv=none; b=WksDCWCd4CaYYvkW7fEGzV5w6vZl4qn8aBoe0pLiU4gLQxu5SzzVi/aSBtFoEe1yjhyFR3X2qNz+UD/o4as1J7+qqqNKFcA90rYaKMetgkAD/873WltlUVLaM9EEjvd2rFLxz+10C52XJDDv6zeMkSHti1rtnlWmlTLvgiJ+V5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709345; c=relaxed/simple;
	bh=iGAz2ljwaJdqkt9H440YjvvYDSFEfsAKSStmeLrCUtM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tRlGvOvYkeU+o2kXMgHl8ljjQPwfFboxeDUFDFGu2SLqO0GZSf7iUwYNGiZQwIZ9qbWsMzcRbAkrAzSnfCBzatsgQ0I4q+y6dgjPpPeqmvf0FmNKGbjdPKRzDHKmJGV1ywG5lvRg3TbjBbrfw11cUUtOs2UlF5GsB57COkOu3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8WHHzrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8WHHzrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CB9C4CEE7;
	Wed, 20 Aug 2025 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709345;
	bh=iGAz2ljwaJdqkt9H440YjvvYDSFEfsAKSStmeLrCUtM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o8WHHzrBCF8m1uztqxoxerTqOYUVvqikj/uRwyCVCFDuspbKMmSCWOL58ea/p0Xqt
	 WLygirDGp+yeoV7qPpCbIbUKJkLuDrCWggSL+UeUxtKZZvpYAgmnLO6Xjbcgh3Z39H
	 grkFrAG/YNyXVd1qydT20YlBnd6sSjqktY7BUAlVKp/aPp1Ixjofxb08x3dG8Tgk9M
	 u5Rp1yGWGAkGD6P5OxIEHvJkwNkgBJh+Gz+usbt75Dj8Os/daQRuClzX8WYnXfAbn4
	 DXPk/QU5bOefp3MRv1m0uPGnZD3+lDbu5XAKy4C8FMFuyjhkD/p47i3xHdYeXOly/6
	 fHBGgaE7Egt/A==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20250819001522.13011-1-andre.przywara@arm.com>
References: <20250819001522.13011-1-andre.przywara@arm.com>
Subject: Re: [PATCH] phy: sun4i-usb: drop num_phys assumption
Message-Id: <175570934053.66459.17487502489276312055.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:32:20 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 19 Aug 2025 01:15:22 +0100, Andre Przywara wrote:
> So far we set a number of expected Allwinner USB PHY instances for any
> given compatible string, and would fail if we do not find every PHY
> described properly in the DT (missing reset/PMU/clocks).
> This is somewhat redundant, as the DT only describes the resources for
> the implemented PHYs, but goes in line with being strict about firmware
> descriptions, and rather fixing things in the driver code, based on the
> compatible string.
> However this causes issues when we make a mistake, like we did recently
> on the A523: there are actually three USB PHYs, not two, as we assumed.
> Changing the number in the driver and the compatible string would cause
> all kinds of compatibility issues, both with older and newer DTs.
> 
> [...]

Applied, thanks!

[1/1] phy: sun4i-usb: drop num_phys assumption
      commit: 75c21418beb92382dda164fdc2554610b49ed441

Best regards,
-- 
~Vinod


