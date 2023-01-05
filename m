Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E06EB0F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 17:18:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d4so28820058wrw.6
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 09:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VChtWA5HK5AG2rAtUk+ztjmVxkEmPar/HvsaNCiAzRw=;
        b=j00VTv2Y9d4T95tjvsiMRYO5bG4sGTI54DKqwcVm6IgjWgfc1erF65qYDJh54nEUPM
         ohQoo6qK1e0w2B/OnP42WLot8g7OPpSxJGaW7bGVOar4NfJTA1emfs2D9NRl+xWGUlzx
         LDuVpNedTSX7KVF+WxD5zBeSjx6+PSJTvvT3nJFKkJ+YtAgXYKk8vkHIC2jROM+IFFID
         +GVJzcnqu7Gmyt66cSeTACxDpoGvdJ65AlKjRpvlnMY8dVc4m0QZx67lL5lBoTSO7eaQ
         emGIAGL0YFxXG8FK7zLsMZVaQwdtPhg/lmHfS3/hTMJML+B8+MPvV6ARYB/j3cwR86oL
         FR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VChtWA5HK5AG2rAtUk+ztjmVxkEmPar/HvsaNCiAzRw=;
        b=R8PQd7v2NW1IFREdJiZTo9ZIFrOyHtrzi6vZAym8CUzhThCLlyfqVeAiCQW4SNosWd
         k8M83bkkjFxf3NLbDZEMbIBU+tXhGXy02BdH2PGEQcImppRP8xGGvpjLV20Yyu+qb88d
         af/fo6DxX68m/azlkLbfceMCFjpceImmLO1zeXfJ6V4795sSQzO+x2yJTId6T/ixiH4G
         yHLmNt7QCm0t/Uvoc0u9Xo4+cQHIGL205Wl67C02DBoMWWko8+HAoP6+Qw6RZEsVut4c
         DAxEpxa5GZyIPOGgRpsbF0kNt7x1ae5Sazw60jwvd/JfnxQEVhWqmtgsJMrzrCDSbxni
         BPUA==
X-Gm-Message-State: AFqh2kowtQeBODckqHCRjlBaeSBQW/QvxQp8roePy/T7S/vbbZnZ8W6S
	isDYkWn3YvRdARXllyCoBDe4+8uGN8bZ7i0e
X-Google-Smtp-Source: AMrXdXt9qSAGc/Dlf6Chtr57J60AD6VkWYwy/2f7x8saezg8sBS79QzWuezFNygWI11cXhMjz/npuA==
X-Received: by 2002:a5d:6e0a:0:b0:242:10ac:ac42 with SMTP id h10-20020a5d6e0a000000b0024210acac42mr33558999wrz.55.1672939131327;
        Thu, 05 Jan 2023 09:18:51 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id m15-20020adffa0f000000b0028f9132e9ddsm18227421wrr.39.2023.01.05.09.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:18:50 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 2/2] rtc: sun6i: Drop the unused has_out_clk flag
Date: Thu, 05 Jan 2023 18:18:49 +0100
Message-ID: <3471996.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20221229184011.62925-2-samuel@sholland.org>
References:
 <20221229184011.62925-1-samuel@sholland.org>
 <20221229184011.62925-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 29. december 2022 ob 19:40:11 CET je Samuel Holland napis=
al(a):
> This flag was never used by the driver.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



