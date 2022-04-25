Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAEE7E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 17:53:24 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id g6so8296331ejw.1
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnF2m4xWmZU4mmTA2zlwzl8U0HY1WmVOSdpsqMfFRDc=;
        b=p6SLmrfQUx8YcxlTOmJAR84PN2KLXoayR3X3avOVC2jJ0BKBczgjaxo4/ZioSw5rJC
         XcWA77v9eo9E872XR3TTclpykB2zLNieZY9uA8gUhumW/WauL5W11CoQe/3UNS/Cd7Gf
         LC2BS37K69LetCrBqbA07l2xsWu0DUHYJlvqVSDPW4Wm53YNUf7GiSNdYxcihCQAL9SH
         OtAKyhz/H4ElgMoQekvE3ApZ76ZwVdINRyOGG1MrXgFdiHNe3F18kUQB+H00FlslBwID
         R0L2q2jBozTD/r4egbzs7jJU2AhazHMJ5Olhn1Ds4sf0wl2O2+mKWb7jiMG/o4RMlCix
         X5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnF2m4xWmZU4mmTA2zlwzl8U0HY1WmVOSdpsqMfFRDc=;
        b=RdBhIMk8WsOaGNvFYvB0Cf0mTEtDNRe0lAkVNFq647OWPGjDesq12H6KPL69opW3Bv
         Yk2Z4pgCSv360EhkFg6Fz9mJ7nL3DUjGSYgbe/KEd5lW9SW/Br8aGYMczYKz2zqYsc0C
         6Y09iv7/eq5NPFlxWhFOyd4825urTe1q3zT7Y7qlUX8OmXCt4i8GfcMjQeSKCz71Ugp7
         /Cd2cnXoUZFpXmDVkKqFDrBjaTlUzXYC5oIzXGSygiRBJ46kNolXpGIdkaQpJ7ah0N8/
         K0MPfCsqU8Q4zrt+Tsnm3+iM3wTf0WTSn6NXlmG3D7FlEjsZ4scJFwiANKQWhLpzWYSK
         BuQg==
X-Gm-Message-State: AOAM532RVZcKhqRaMG5LOpGTvCQXeWlj0LTlCdxEpG2WzNPSyNIxiYSc
	Jzl8wp1qmvjRRnLaqqwop4k=
X-Google-Smtp-Source: ABdhPJzWj22q1Zgr6ZMUTNPCd7QA9rkf7OLHscY5eDZc4kof7XQpeQG3Hs6FXiWTaMlCqelcYMasQQ==
X-Received: by 2002:a17:907:2d8e:b0:6f0:fac:4423 with SMTP id gt14-20020a1709072d8e00b006f00fac4423mr16262553ejc.310.1650909202965;
        Mon, 25 Apr 2022 10:53:22 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id bm6-20020a170906c04600b006e89a5f5b8fsm3875338ejb.153.2022.04.25.10.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 10:53:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, Jernej Skrabec <jernej@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.18
Date: Mon, 25 Apr 2022 19:53:21 +0200
Message-ID: <1741873.TLkxdtWsSY@kista>
In-Reply-To: <YmXPemmFqfcj4p/p@kista.localdomain>
References: <YmXPemmFqfcj4p/p@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 25. april 2022 ob 00:30:18 CEST je Jernej Skrabec napisal(a):
> Hi!
> 
> Please pull following changes for current release.

Disregards this, I missed one more fix.

Regards,
Jernej

> 
> Best regards,
> Jernej
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/
sunxi-clk-fixes-for-5.18-1
> 
> for you to fetch changes up to b4f3d5f06e29b7020f19cc788b2c2de750e888a1:
> 
>   clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical (2022-04-24 23:22:46 
+0200)
> 
> ----------------------------------------------------------------
> Two clock fixes:
> - missing sentinel in device id array
> - missing critical flag for rtc-32k clock
> 
> ----------------------------------------------------------------
> Samuel Holland (1):
>       clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical
> 
> Wan Jiabing (1):
>       clk: sunxi-ng: fix not NULL terminated coccicheck error
> 
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> 


