Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B135A39A;
	Sat, 14 Mar 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773494025; cv=none; b=azgglfPnhzoIfoKLZM5Wt78rQPgRTXk841xL/phALsaSQ8uK890jRMIx578C9s1UgyLNxORUzcWfIN47NS6yZ8Be5lHVKUG2BXwNJlJ5LeHobEgtN5IzfPDNluEJ6xSgZwpJ+gAkk1pa+dA47Ou/mJhUbVplTOjxj3fQXdQM3yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773494025; c=relaxed/simple;
	bh=6gcZCrWNBMWCJ2rVIp8u8DGpdWLgEe3iegnZ0nHqqPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QRjsaMjxXA34Y6pB91luq4PeKmXAUAnHxHUkTIpWziSvD98LptEPja4BCxf5TFOikXNdtXdMKp++ddULO0WQ4LceGvWe/5Wb6N/bTeHnRpFQe92BBxHqjzhpIuVdlGwRxEBldqwxzVK6sKgCC5KNJDqRw4AeUeDKxky/Z/gGPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6eSe+7r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6eSe+7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F947C116C6;
	Sat, 14 Mar 2026 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773494024;
	bh=6gcZCrWNBMWCJ2rVIp8u8DGpdWLgEe3iegnZ0nHqqPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o6eSe+7rRxpimIhRgJz0UD0ujM1PWgKdkdaQDhvJyAVm7CYaFoMzBl91PcrcLVzKv
	 rLswmURYOYRA2p8X/mTAuARSDSOPqtbcLnR4Drl2laA7xUC38nBicD8Ccl18mnzRdw
	 HKPtQsl1vq0EyCgDPtCJ6pPF4J1cFyeCcw0QE7+jGwMLt0JQtitClQ981Y9EAyy7Qv
	 LSW2xnOYX4MdqLYjYkaD2pQ2N+D1HYba5v1HuSCgyN6dU4CFm0/cONKJoxlY6AJig8
	 o4cgmPCMr1Uti3yc9DTYfq+VQEuN6WBp4Y7K67vr4aTOUW8ZW2UR/0EsQn2dxbjAHT
	 sdo79JRByBvzg==
From: Chen-Yu Tsai <wens@kernel.org>
To: mripard@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260226163836.10335-1-ethantidmore06@gmail.com>
References: <20260226163836.10335-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix resource leaks
Message-Id: <177349402208.44870.10275878012349571806.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:13:42 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 26 Feb 2026 10:38:36 -0600, Ethan Tidmore wrote:
> Three clocks are not being released in devm_regmap_init_mmio() error
> path.
> 
> Add proper goto and set ret to the error code.
> 
> 

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: Fix resource leaks
      commit: 127367ad2e0f4870de60c6d719ae82ecf68d674c

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

