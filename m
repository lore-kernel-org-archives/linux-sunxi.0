Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3E1FC9
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Oct 2022 03:56:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id w18so36979994ejq.11
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Oct 2022 20:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXizNkH/R+e1pcdGI2c2lbV1I/baxKR1Zsps8qTE1LY=;
        b=gXpUibeLCHIQqA7BBqDECEJr8yqLLBsXJElo/a+slr6k/AMsbCRKQMhm7FfIH5j38w
         48apUQLuteTAq5izn6kTO71ajX8BhYTGN3VpkcmsAzJmZ1uErbISfqnzE58JV1ZAf+WC
         dYg+9FG90XSdNeqMFzVd7KWKhqdpxkV0mMFB7YxjSUTquUbTsanyv+LVShas5ynG6kQB
         /zxMMZEsZsSgJ4mvgMED8J5oGM9OlV/VC7f32uBY/l8s4hzcUH46x/wWYhyz4WLvyxzs
         0SIARvrOAYitMxbi0/Vy20cbQ5+AWDTlukvjj8ziCYC+PAboF13HOq6kiDEoKHNrOjVb
         Yayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXizNkH/R+e1pcdGI2c2lbV1I/baxKR1Zsps8qTE1LY=;
        b=Qus6JfY5P5nmxSwuBMKNroKEXMAh0vGNvtpRZ7Vn1S+VWnvh8/XDNg85qv/vEs+W24
         NbCgs5u5cEBtDvRRlutvrBEdE1y5LuIRmto3sgW/KraAM1REMjeU24But5wSfemnLyj2
         sbuuvmC7WFyAwX6ZTj0Zk4oxf/70GnnAL4EaW8CTrbss7Q8L3cKMU6eL0txVtKz3mcG9
         6PVfEpwgv48OVG+W6PKbqXchUQr1biar4HqpYkP2WxnifHtEt8NDeWQmfAYlY0anBRx7
         G4kjehUbCeZPAIc1dN9n+H7nxr5E3C+HWuqf6ATyben7w7hRHP4BX5yxL6P18Ulqyr7t
         QAzw==
X-Gm-Message-State: ACrzQf1SfOH2rlGCJppDEX/TJT60qLoyZtlfZIO7YlGztLd81Ob5UfYP
	pLtpAo4Jtd9n1i6I4O5hynk=
X-Google-Smtp-Source: AMsMyM5OM4R2vvUMIxygwEZlzJovtBMpE3TkEgi5My/X78KaifFnKstqebCkO6xhWoH4vnkCmxEudw==
X-Received: by 2002:a17:906:d54d:b0:78e:f130:7099 with SMTP id cr13-20020a170906d54d00b0078ef1307099mr5143652ejc.142.1666151783174;
        Tue, 18 Oct 2022 20:56:23 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b00782e9943c99sm8041009ejc.219.2022.10.18.20.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 20:56:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, wens@csie.org, samuel@sholland.org, Ban Tao <fengzheng923@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun50i-dmic: avoid unused variable warning for sun50i_dmic_of_match
Date: Wed, 19 Oct 2022 05:56:21 +0200
Message-ID: <4775101.31r3eYUQgx@jernej-laptop>
In-Reply-To: <1665895524-122458-1-git-send-email-fengzheng923@gmail.com>
References: <1665895524-122458-1-git-send-email-fengzheng923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 16. oktober 2022 ob 06:45:24 CEST je Ban Tao napisal(a):
> In configurations with CONFIG_OF=n, we get a harmless build warning:
> 
> sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
> 'sun50i_dmic_of_match' [-Wunused-const-variable]
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


