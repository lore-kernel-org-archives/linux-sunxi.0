Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9267E211A14
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671947; cv=none; b=kTKGmC6HVmdOvLXyYB/zxL9+8qdmGkB6k7T5lQUIxr2ulPUk6pM02eJhIkh6ZCYbireXvOZh3nCUab6+qqBQP93cflkzBZt85yPDjhnv6Jc2KaByaYjxSMNGPijUv4Q2VJ04+fLGhQHaY4GQFjPaWMQYS/XYTdZ/JSiTlaP1A4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671947; c=relaxed/simple;
	bh=6EGaNiihiDB64A0I9Mnu2VyM4of6JeXngApmLp18WOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rK4K2fu+HyK1iQ7wSm1TJLDJmZutIY0KZeDudYAsAsACOZBUH3pCEPsSY+HIZxbah89lMJ71/vD2Z/VDVmPB5pXJrdbGQ4wvW5cjnqYS6lgQmzM6aMeNF8UbAykdH4T3nw0scDOgYE0IEmrKOph5nwu5yXUK3Ov0cV/KIa3o/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/3fpnz0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/3fpnz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9158C4CEE7;
	Tue, 28 Oct 2025 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761671947;
	bh=6EGaNiihiDB64A0I9Mnu2VyM4of6JeXngApmLp18WOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e/3fpnz0tW8xBXZn7F/pXs2OLRKBi1VWbu0DKxq2mO1YvR3CSRqN60SMDj/1f0DC6
	 sNbvBSPY9sVQW3FeuCXgxWBTo3uKj1PsEYiD9xcgvsvVRelMxVy73+iuaibzY9Lver
	 kxVxrdKW6ur+FbtQskktMbwIc+An1aC01UkXBZ0+sAfXiWkU0fgeD4rndGejD9pyhI
	 zFbEhRVWutW+FyNTaRf+cSZ++rNdJfgASss/DVNnTwVOT1YP9Q5aGuq2YrKF3c6jOD
	 vN+06GciBvpVmdmIBnRSn2WI4X/MweWbzF86vUJy/6EQP76nSI5b8IiITOq5yycHYb
	 MgxDxD+mfZ0Bw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E391A5FC7E;
	Wed, 29 Oct 2025 01:19:03 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
References: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] bus: sunxi-rsb: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-Id: <176167194385.1176535.2348442738028214787.b4-ty@kernel.org>
Date: Wed, 29 Oct 2025 01:19:03 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Mon, 27 Oct 2025 15:33:59 +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> 

Applied to sunxi/drivers-for-6.19 in sunxi/linux.git, thanks!

[1/1] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls
      https://git.kernel.org/sunxi/linux/c/122df8416e7f

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

