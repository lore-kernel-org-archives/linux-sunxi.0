Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E5C279903;
	Tue, 24 Feb 2026 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955424; cv=none; b=EP7bWnOA56fbd8Q6EdVMk0QzWnfsHq1ZbuHV8IO6x66OBHjrW2SsM8sKbgB/DrC+gDXLCY3okNCVBYsN8t0AXgWHRNzTWu6PcEb0b/I2wr7FZhnv3hy2a2d0fiaLftetERFbqlBGTzeDr40XpxuHfBkz5W/seP7gdPm/NaFTavs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955424; c=relaxed/simple;
	bh=F7LLqRfY0kTwQ8BE+UxIrv/t3EnNWvJa9AHwvWsksOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GJ9faxIiFY31uAqPx8jvS6sikvpdkXMbeTa5gGhf8z6JJmdTFUiDW5HgfuFB6weRxnjPobceNRkKLew5R+maAwAX7Fb4nBMhwgWkfp9WXE9NDdCRLY5q0GHO5JwQmfamgOgzuDbSjPB1LKijGgDcItKYHS+ddxBGxQpJRMZux00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=se0fpwda; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="se0fpwda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EE7C116D0;
	Tue, 24 Feb 2026 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955423;
	bh=F7LLqRfY0kTwQ8BE+UxIrv/t3EnNWvJa9AHwvWsksOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=se0fpwda7VQpav9DbJPXRO7d/DLA8vi7fIzX254oV7zg3gu+Wtnl+dPdJCEdzrWrp
	 xDw5+nO88tmQi9tA/kHZBdoJxiFBxHAviXIrWafd/8+lg6uJw2oZPcadfTvR4TEdhx
	 QKnNvcIlufVBQG1F+uJiN1vdFsjmaor2uzmADM054ybRF/6mLlo5UbhmpNdQQCKcrh
	 hjLnonyIOzlvScMp0tY/P8dzsaLPTZTu6fK5X6MRX6DNGZ0nMkIiRGHxFFzxefrzbC
	 lGPgnDnHW/r2x5DC6B9i0+yLHf8FD+0oAgLpyrty0oTW9oWWqlBZeubLmg1JBBOWWV
	 LIPczzX0ArOhg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 samuel@sholland.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260218183454.7881-1-jernej.skrabec@gmail.com>
References: <20260218183454.7881-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/sun4i: mixer: Fix layer init code
Message-Id: <177195542102.124563.4695179649495877444.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 01:50:21 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 18 Feb 2026 19:34:54 +0100, Jernej Skrabec wrote:
> Code refactoring dropped extra NULL sentinel entry at the end of the drm
> planes array.
> 
> Add it back.
> 
> 

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: mixer: Fix layer init code
      commit: 744629904c68bde847c31819f23482d09152f810

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

