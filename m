Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405FF818
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Jul 2023 08:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF6FC433C7;
	Mon,  3 Jul 2023 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688373194;
	bh=X5VfDnbqCcPJEZik/4j9K5nnRYzFSOO4lymDpqs6bqA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ABiQRjEtnpqBUsrN0fT5t5WyoQYRxurLc2aJy8jwEC0Kg63sfYBlkQDe/GA1u2+uz
	 lYsMNXbV1fmxmte/IZIU3JcncQgW1VYMfAY3oeeGboGsfMKigQCQ8f1/bNS3FpWOlt
	 jA3bgB4274bAYsXgILl1F3IKyUkeYu8/7mRaiy4iMmtfzrvybQhZpcN4t7Li+LafjK
	 dPP8TJk6VpSKoUIogbRPhuZ2rfNZLGLn5ZiVINsH4sa77P6ufD/gNilnWapftR3J+V
	 QhZBwelnhyADe3wbRDRwd+p0mAH8oFRM+SwYQE6lcHVeS0NsUuv3zuBb8bSpJ39zLc
	 Z3ffwEX8cN3xQ==
Message-ID: <b24c27d0d32ca8ca4c58773e2d45b8a1.mripard@kernel.org>
Date: Mon, 03 Jul 2023 08:33:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Mans Rullgard" <mans@mansr.com>
Subject: Re: [PATCH 0/3] clocksource: sun5i: clean up and convert to
 platform driver
In-Reply-To: <20230630201800.16501-1-mans@mansr.com>
References: <20230630201800.16501-1-mans@mansr.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Chen-Yu
 Tsai" <wens@csie.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Thomas Gleixner" <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 30 Jun 2023 21:01:25 +0100, Mans Rullgard wrote:
> The first two of these patches remove a bunch of duplicated code/data in
> the sun5i hstimer driver.  To keep the diff clearer, the first patch
> introduces an otherwise pointless struct which is then removed in the
> second.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
