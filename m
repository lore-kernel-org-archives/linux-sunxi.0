Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8D8829
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Jan 2023 23:51:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 4CBA5C3F86
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Jan 2023 23:47:32 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7385F40003;
	Mon, 23 Jan 2023 23:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674517644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jwmcVqno/YcAQeOYokZ/vj5NmGSag+BGNuxqJkFhlmI=;
	b=o9k+1bE129WTOlXJLiQquy0CTYzOwComZEGon0prGdvsiAf488iRtFThFaM4UroTt6/LT/
	G3ELWt95VYwPuntnrvHYWEakost8RHFHFZAW52XcWNoT7z09LFn/w/rwGZZ7+r5KU98o+J
	nSFE5ljwVM/wnTOoZ+8FqonPaYeCXc6gBt+u8GnzM15MT4NpJEH5EFOzJb6UCOi+2DrmSg
	zncttuEeq3nhJU/abbCOcc8EyvGveWxnhH0h4rGXhBb2zieEEqhd2UZBZFD3Fy7nD9o3xq
	o01T+pnHjf6Q6U3C/QezLMCYydBrBtUuFs3/gfM5B01JUn1/QMYmV2T2UBG6jw==
Date: Tue, 24 Jan 2023 00:47:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] rtc: sun6i: Always export the internal oscillator
Message-ID: <167451762667.1272571.6826220647911763740.b4-ty@bootlin.com>
References: <20221229215319.14145-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229215319.14145-1-samuel@sholland.org>


On Thu, 29 Dec 2022 15:53:19 -0600, Samuel Holland wrote:
> On all variants of the hardware, the internal oscillator is one possible
> parent for the AR100 clock. It needs to be exported so we can model that
> relationship correctly in the devicetree.
> 
> 

Applied, thanks!

[1/1] rtc: sun6i: Always export the internal oscillator
      commit: 344f4030f6c50a9db2d03021884c4bf36191b53a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
