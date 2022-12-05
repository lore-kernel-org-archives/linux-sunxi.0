Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AD7C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 21:14:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gu23so1504264ejb.10
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 13:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwCLtcgRqAXaeCXVskNsfVzWFdvmdwTNRfhMMyafH50=;
        b=nqQlU52LHVuHNQPy2g4cmtI6I8xJfVlddc5Cndp6VOX+HVh2EkEYhxu163qni6ouO1
         Mwj/l0vXDKR/1cOLAx15GYMJIJeWgLY7W0GlvO5o3u5Llo1w/avJNuL06Mk5QbLT0n89
         0W4dHN/bvLUQcSJIY+q+UKLPPcvPza2BteC4yR8BQVaWJ6WIU3GvSB8NgCNhcj8MKMhq
         6BgHba6QKO1BiVEySKfWE7bb4AypaCyelEODU11KGIr+6NjQv9U+0NtDPxRy1L5wkwH1
         f3onqe4vNErYXuJJO21En+tjM38OvqryDqw63M67bttvMlZ4BeZQjF9bDxdI9WfjrCaZ
         M0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwCLtcgRqAXaeCXVskNsfVzWFdvmdwTNRfhMMyafH50=;
        b=u7hpG9QQOCNRY7hRAriYuYJBTNGsPNbFX9dMULd+Mlid8mUubDODi8vUqJ/hpAmTuu
         KS7+CZ+mMBBsZspCcv5QvPHcnj7BZW/OwQatTyvyCEgEx6/kbPZ8Hq8i2/LsWXhLCN28
         2gaUeyRl2up2NpT8GVMmTy0JLPtLorxvSJvBl+MtzAYljNPOG/9GAHMe3CIC0obnprVZ
         3l9HdYSLuJD7E9+cLVBPObyPAsj1sDELyBQiIPl9YQMYq4I1Eh1Fq41opR+6MrQCKnRT
         wBFrlzKymyS6e+5P1jNWS+H4wM3wH1Jc/L2B2Egoba4bT+yXitCxK8gzlzkuYBuhaPPE
         khLg==
X-Gm-Message-State: ANoB5pn2Uf0pGKStqn8L62KyAfZ27X/FWLxBDZ5Mff9D59LKxiHshtH5
	LeUyTm6XZIoTkLShW9tKSsef6CM/N8u0xA==
X-Google-Smtp-Source: AA0mqf527m69tsEGmdPutWKFPV0Jzva42TA/gfB89ypPw7CMGtIYrCgOUwTqqC3WL5n8OcaF1Bo5QA==
X-Received: by 2002:a17:906:524b:b0:7ad:a030:485c with SMTP id y11-20020a170906524b00b007ada030485cmr68688048ejm.605.1670274859173;
        Mon, 05 Dec 2022 13:14:19 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id ca13-20020a170906a3cd00b007c08439161dsm6631006ejb.50.2022.12.05.13.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:14:18 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Yang Li <yang.lee@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: fix ccu_mmc_timing.c kernel-doc issues
Date: Mon, 05 Dec 2022 22:14:17 +0100
Message-ID: <4105181.1IzOArtZ34@kista>
In-Reply-To: <20221122184844.6794-1-rdunlap@infradead.org>
References: <20221122184844.6794-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 22. november 2022 ob 19:48:44 CET je Randy Dunlap napisal(a):
> Use '-' to separate the function name and its description.
> Use '%' on constants in kernel-doc notation.
> Use the kernel-doc Return: format for function return values.
> 
> Fixes this warning:
> ccu_mmc_timing.c:21: warning: No description found for return value of
> 'sunxi_ccu_set_mmc_timing_mode'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Yang Li <yang.lee@linux.alibaba.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


