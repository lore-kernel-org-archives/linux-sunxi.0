Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CE43C3F73
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 22:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192664; cv=none; b=EIKYFzsBSDAbv4fIfORt2HdGXlpP2G5H/2MPOVaYpM/LD1DesnyxGRiXpKgiwFz71C3NL6rSw45lMa0AJosf1PGyLTtsTXyp7Mwoxvxy10BYFhtBplEjGa7ESffLXkApjSCkmMKglVgNVK9KmnO9JI2BNWmCumml+KiYkgF6LKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192664; c=relaxed/simple;
	bh=cYqZSULAPjbv8lPLutjNmV+dvBB/Kh3kQ804r0L7f0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HX0T9i6cO8f2F6XaaH/p5MQCRh3876e9v10rnb1ysOvKi/t7UHCO9fkJ2yfSfatETIFLtjSoLjf5DTQGMVZHUf5UApnIku9f4xOUKyR56gm1pOixT01Rva//txq/BHox7YJrhkR9O5rlVyx7lJ3vTKCz/ndS3JsDFYyzvmUL+PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=MwF7jTYU; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="MwF7jTYU"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so1895907a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 15:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785192662; x=1785797462; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x1DgypBuY0YPLbZiAr6RWEjKFGv+xt31+qV/LCUtHQ=;
        b=MwF7jTYUHcPb/i79huyhCsjOKRqSYe7aQ7Lk/CIQ4hd/NQAvZK2SKEkcDoP6CRp0fA
         kBeJXh0iU+9fg8/lEoKX7qoGmCuSz7Js0o8Nl60npI85Gc/emzhBc0u6uIW9AHcL5Ub+
         Kpwet6G6GBdOADEFfDzobKkzxxEcjAgDWFuTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192662; x=1785797462;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8x1DgypBuY0YPLbZiAr6RWEjKFGv+xt31+qV/LCUtHQ=;
        b=YDjaeBxAj/C+4psn+qMgpRJEqz4izb9L24EpFxupQ/G/0t8jaYHtZ6MwYlHkDsM/VI
         EiXttgp2LHDhIWNGrBKMUuGVBk/qYtfymPrfewJJVNr+Ao03zkuMwJGcyV7hzv/eD/cU
         DADoae+DoEHntoSGwDfjCxMgdIImMOUobQ649O3KhyT1HppchAOH2aNUzGdKC+E9+744
         ArLPUmune2sENtkn7KjgQ5quPJlEvMek5fH9Lmf7LwgFg1Y1zqR07+rMDWuTLJ0bE7n2
         GHTS+QS/p4yl03cVBRymPfSX88hZOICW0P+oVrOczViYLYxHFR+2KyM57i0I/iriQZ/A
         2l/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNHKYrk7AgyIzAaMa3/rFwklWQI6AcwGV5GIht8M446xgCZhhV0NLhpkcJKARLLscOiIntuu2Sr06D/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPsVW73v0AI1rKAojoVGBWbdldOpmqahqCdkUZyizKzmojbJXS
	ibL6Zdr0A6TojZDDPY7Br31P6X7mLWnlDwPEThNrKKD0eJwXnetFO/eQXHrEw32YlZN5P9LtyIq
	7eeeq4LY=
X-Gm-Gg: AR+sD105UhrVeu7yiYWW6cz7YK2v0zhlzNFMxITBGZjxTZvvEIzDsKopDN9dcayOReq
	i14VmDP4VDkDPsr7xDhTcL2cLGvt6hf5KjpIXdI3Y+3vH8JPKX+cfophf35YaUjUe8OcNEGTmb7
	W94APV5D/W5d/y7HIYPQlPuQ/T41We3ldwQUDR+3u8UZEuOwbvtvPsmUIu8N8U0jcsTPCrm5ily
	8lpPNSvOpLXh4PY3XG0UBGeQ88iJCN6c4wx3MqDgnsZ7sjS/Zia8BhWmGV0wivt5N8IcrOpY5SR
	WHO7a7Gg8Q8o4sDGUOENf2EH0xsfhz0z1VHOTYQ6PmSjcUb95NatY8ZF1Rqas7TZimffpyLLBCm
	Mv4C6bQWNsvVm4LIowwcM2OoGRmhxG1w61VWrb0j6WJ22nc/BqWwCRVMEUpW0BexJZFEqe4K6Ne
	/uYAZm5lDd75g1P9VBDvg8ozG4fERlyv5SkGuULX6fzNf2kxMKY7LOD+8B2S7Ehn2UOu9KSDrtz
	Dbdy8FR2hG+QhJgVxd93DIWTQ==
X-Received: by 2002:a05:6830:2906:b0:7dc:e37b:b5d3 with SMTP id 46e09a7af769-7ee78a6b8d6mr9349623a34.7.1785192661851;
        Mon, 27 Jul 2026 15:51:01 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29e2643fsm13154190a34.9.2026.07.27.15.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:51:01 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.u-boot-project.org, 
 Omar Ivan Fardjoume <ivan.fardjoume@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-sunxi@lists.linux.dev
In-Reply-To: <20260727174414.22152-1-andre.przywara@arm.com>
References: <20260727174414.22152-1-andre.przywara@arm.com>
Subject: Re: Pull request: u-boot-sunxi/main for 2026.10
Message-Id: <178519266094.74116.10650678499402530532.b4-ty@konsulko.com>
Date: Mon, 27 Jul 2026 16:51:00 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Mon, 27 Jul 2026 19:44:14 +0200, Andre Przywara wrote:

> please pull these sunxi changes into main:
> 
> Beside a fix for a long standing bug in the A80 eMMC code, this adds
> SPI booting support for the Allwinner A523/A527/T527 class of boards.
> The second major feature is support for the secondary Ethernet controller
> on that same SoC. This might not be as important as for the kernel (I
> doubt that U-Boot acts as a router), but for once some boards only connect
> the secondary EMAC, and on others people might have the boot server only
> reachable via this port.
> There are some smaller fixes and improvements still queued up, but they
> need some more testing and are minor, so can land a bit later.
> 
> [...]

Merged into u-boot/main, thanks!

-- 
Tom


