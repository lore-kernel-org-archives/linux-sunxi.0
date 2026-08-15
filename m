Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F04071FF
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Aug 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786778680; cv=none; b=TmLCBiswp8DwH6attVme0q6yp0RofBVCUHHvIlg87VL8QG23PsftKqEqiGsA8/1LbE5K9CYqCpcoT03sZdmQobSSTBKWSFHHJmod0cEkVP7z32W+YmR20pswr5f2liYfs1KDx/ikRwvxNftNxfrpnzwxe1lrfe1VAaWOlG34Y80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786778680; c=relaxed/simple;
	bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLMM3KHVpmrEW9HUG5VbrrA/EaL7d+zZwO7IDjbb37NyHItm38yOD08i9RIxJh1gmuf1vCtDvBCRF1mVS/Nqgyxepyac4bd7G+naaxTfMgebBQTOU8fXZs21Tl8OKw+oKiozZJLEPNyAmiof2r12zMx50onIoO6ZhceZKq2WEXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c11XuZha; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c11XuZha"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1553442a91.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Aug 2026 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786778678; x=1787383478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
        b=c11XuZhaPw59yyl1W/Ct/yOr6+6AOaoRlzz5VPthFEng9LmlN8Z9FDUxoKLDkAD33W
         hUY1lzJP5O7NCECP9HG3WQvoyajUKkLpYeNHIr3pTzTWXayhKOGLAUuNdNjGGGVGu96r
         /NkW8Y9/s5lwaQ+YHyKG6lOcEtXOp5rd3eYqjns1Va/ZHJsZxrEikUoSvx08g41Wg4S2
         1VmSLExCy2UChOuLu/eDLgbFF2vPZ8013aQsXXqr4V8ZeAVisPy7JZc0pMKwuSb/wO7P
         jqhFnHzIk+q3Oxi7Krxp4CXfGDoqiuxNxaYy54Ub6uYN57RV51I9AGZzrqAfc6l8rP6v
         rD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786778678; x=1787383478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
        b=BwlXsMWYzrehW9/bIMrDVkiatL1QRgJL9B6PNBCp7jU4Io6DStBaR7nj/JNoIq8Q0v
         xAP5rr1iH1xYoQJYWoFE30eka8Z9ssO6K6sRqwbOppT6EYLFEOp4xYXGwLWJ81ZOyjqy
         4jV/Lcp5VamGtR3lfwcgAHQcuzvTbd5H9TGa3gsZEdK5PtIzhyJu+M0DyzpwkcEmXkNZ
         6Nn3+Ck8HK7yj3zunTSoQOxWjhud2c+By1y02q6/A9hYkNXBgeN7m4WscBO4qkU223TK
         2EsAEg8TFre54WzhHfnbGmNPHdw+HBc+NFVkTT3BkqAE5W79D1pVQ9ly94UifKQsqu/S
         C/aw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+3euXOsXaTEHFCxnFxov98+xCulhgCk3o5eOgkdVKzCwtvRa/60FgKYvJylivZFsVQW0CaEiT8GSeOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVS7fE0hC+XmEmh9QItfbOk2RcxjWkAVwhSZB2lFKPXYipKec3
	h387Fp6XDlZonwriRBE/4EanrGVmMvzSDKsg3xPjultle/m8hgVvu6B+
X-Gm-Gg: AR+sD10JHJA+d6RJ+jCOi16c3c7VWM82WjWMZ6HbhzoBEPvOpkBBvoqUl3UQi7NmyLt
	KBQoZ5I9GgexxgFtbcb5lJu7na4pvVmO0LSYrqcYxiAi6ETIjIA8dyZirrVFHwGrgWBz0hW3PbX
	c3bcjYE0iJJ+c0zpt9U8evkwp8sF/p5RjA0XIVI2WOcg/bxgMlt77E6kdEczxdRQxFe3Xo1+k/o
	Ml7TCqvdHVhc3Stde6Fuev0G3nuLBH2L6RV5Yh4x+ZTPpjVmrzJEp1xKqsLQ1+XHK2qzyIb76dk
	AIltYTE/ALO9ElOnafAYEd8NHOHULt/PiYOsqhbO3bKwyQukH5EnFUAJDmWpiAe9Q2ryzryRgPM
	hArwmtF97SaYf0xdqKBHckHSkFTzz20XnXgNMafr13KfQiYQ3U4BMHQaRRybt8lTMLYDEQBjmmT
	c8eAh/QgGzbp55zOEp2tCOt7Qcl/P0+3Kw3ccH9GLq30FhZXGbYhdcIacvXW+aEl+y5zepCy+H3
	EJ65VLygeWM
X-Received: by 2002:a17:90a:da8f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3933b95e327mr12509086a91.14.1786778678185;
        Sat, 15 Aug 2026 00:24:38 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm27142118c88.8.2026.08.15.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 00:24:37 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@kernel.org,
	vkoul@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error path
Date: Sat, 15 Aug 2026 07:24:17 +0000
Message-ID: <20260815072417.2636042-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <an-B5SdpGfsJoudH@lizhi-Precision-Tower-5810>
References: <an-B5SdpGfsJoudH@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 14, 2026 at 05:00:21PM -0400, Frank Li wrote:
> Drop review-by, I prefer use below method to fix
>
> https://patchwork.kernel.org/project/linux-dmaengine/patch/20260727061142.44195-1-zenghongling@kylinos.cn/

Thanks Frank, agreed. Hongling Zeng's series is the better fix since it
reuses the existing sun6i_dma_free_desc() helper instead of open-coding
the save-next-pointer logic in each error path, and it removes the
duplicated cleanup loops entirely.

Please drop this patch in favour of that series; no v2 needed from my
side.

Thanks,
Chaithanya
