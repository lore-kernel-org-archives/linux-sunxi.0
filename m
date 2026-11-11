Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399256;
	b=xlVUpE/fbf3WfKkTLz9Nej3THib+9j+hNsa6l1nmstz/XcfnbtnNxJHLgfYD7Upf/hLz
	 wM8PFvBS+zk4g5sVYvQ5MBbSADuI4JCN2hDpyAU5APYLBv/PkYqVK003j+Cw1Amo1gixd
	 BCPnIL8jVA/6DHZdw52dxTdVGCgG7Ynrmo4iqC/JPI9VowzdxQllXMR+RJz8jeoQAtAl3
	 zOmdh6iRhIwi/1NwxQBAslcboK59vfHZhZ6VgmSrtu+j8naUvS7w0OX5dPPqHJMknHadA
	 LN21eYpH9xIoOp2l4nY3dzGmKskv/mbFexMFh4HJNu82s5XFwuwSVAeCEmYhNpepqIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399256;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DbcE2bUVz1VsfhEElqF/ElHt29dBq9uRugEJq7JrVT8=;
	b=pednnXHwKwE62KUzpBx8TkqWqcfGnyGq5OL6ECq+gzNA31fJf8/lnCL/P0EvlM0+QnSE
	 exDwKiSk4DymwCD7pCGoNfyEz/aoqCwT94LJVoUOQ7vT+CJnuvWXCD9eZtDoRU95EpBON
	 VazIopK2Xgf0pG3sgOsOc9IQFUZ/JBEkObjIG9vqoRTml48TdXN1svUtTxUV60bT1tjDt
	 TEVO0dTyaBQK+ZPi1KrytqGy88FzbaMBfWOh0qxxd1N+qItQd72DJGNMxkOrfAGUDS7gS
	 9SFaHWth4sV3u5uFajm7z0lPD546+nMW589/++J03pUIt+NKQTKZT30Nug+YIrBnwag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D4D606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 12:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFB51F00A05;
	Wed, 11 Nov 2026 12:14:15 +0000 (UTC)
Date: Wed, 11 Nov 2026 12:14:12 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: Allwinner T153 Linux CCU/reset support, is anyone working on it?
Message-ID: <20261111121412-GYA44018@gentoo.org>
References: <20261109114602.49907-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109114602.49907-1-vinicius.eduardo.pedrosa@gmail.com>

Hi Vinicius Pedrosa,

On 08:46 Mon 09 Nov     , Vinicius Pedrosa wrote:
> Hi Yixun,
> 
> I saw your T153 RFC for sunxi-tools (#252), and I've been looking into
> possible upstream Linux contributions for this SoC. I've ordered a
> Luckfox Lume (T153) and would like to contribute to its mainline Linux
> enablement, starting with the clock/reset infrastructure.
> 
> Do you know if anyone is already working on the Linux CCU/reset support
> for T153? I'm particularly interested in the R-CCU and RTC/low-speed
> clocks, and I'd like to avoid duplicating work.

Yes, I was working on T153, such as tools/u-boot/kernel, currently have some
patches queued in my local repository which aren't refactored for upstream,
but the functionalities are basically working fine, all includes the 
CCU/reset/pinctrl, up to gmac/ethernet and emmc.. which is enough for minimal
console use scenario..

I do plan to send some initial patches out for the v7.5 merge window,
but can't guarantee how much can push to..


-- 
Yixun Lan (dlan)
