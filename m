Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA7338F34;
	Wed, 20 Aug 2025 17:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710359; cv=none; b=VZ+896/2fK8+E/IsQ9fUmDMmoSVDeopjIfGFUrKzGW81+C5X+RlKrt/EoTPwuYVUH9tyL667E0PANezvcrT35pQO4LhiCqnQWhua1dSXDveqemNSYRhNg/V4ntIfRfkXjQPas8QywgHKsOfue+Ab/4oS0HnxlnelUqIR6oS5wn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710359; c=relaxed/simple;
	bh=1WrHwUVDh5BTH9ed61d8R19JBPsLFZBvio9ttjB4cDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VcBB9eE20rNfaiZdmIap5kIrtmirc9kHL+qWeb8V9WA/HRPZ+jjg8GmOhu4yOdrTMCzyyR8yIDNmiclfSrAaOU2coAt7DUReB0MFoJn6wiOxJNuV0GUz9RXb31Tfyr/NkpG1l95KYAxGHzlrKKtRypxARFk32HvED7Yf+w8VXX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACD8C4CEE7;
	Wed, 20 Aug 2025 17:19:17 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 84EED5F870;
	Thu, 21 Aug 2025 01:19:14 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250812175927.2199219-1-wens@kernel.org>
References: <20250812175927.2199219-1-wens@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
Message-Id: <175571035444.1649720.10442215373072294834.b4-ty@csie.org>
Date: Thu, 21 Aug 2025 01:19:14 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 13 Aug 2025 01:59:27 +0800, Chen-Yu Tsai wrote:
> The Radxa Cubie A5E has a 3-color LED. The green and blue LEDs are wired
> to GPIO pins on the SoC, and the green one is lit by default to serve as
> a power indicator. The red LED is wired to the M.2 slot.
> 
> Add device nodes for the green and blue LEDs.
> 
> A default "heartbeat" trigger is set for the green power LED, though in
> practice it might be better if it were inverted, i.e. lit most of the
> time.
> 
> [...]

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[1/1] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
      commit: 4184f0190792aea06553af963741a24cc9b47689

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

