Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727EE17FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 19:03:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso62674885e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689102188; x=1691694188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCeP3Zg/H4JeLn+58VLEJaihO4ZmKL3A+bfNY674m9U=;
        b=K9F0TplCkUm8fXIoJ2MdfGFgKs5mxm0bkXhSASe7hPQkg7CTAEb8GdkmjugUjLLPod
         E+lMTYnadSLxD5dYjTyXWrJNkMamrFsGGCUATKHn53mnw87G/LzSLvve6mPwH3jSUknI
         I+C1UeXV6w3umiG2ShEXG5dClaEOMHiPJISAYBDTWEPCLuOeRfkHTDL41yCI57/9i3FW
         DVnMRwn8cGjwaV8yGVb4aPJ3JOkzVNFqzJSKg1/2eAmKXPyd9G4siKDUH8cwBxppqgP4
         84Kcjf7EM+2Ggse2wEsduUDqyyV2sj94GOlTMKR0Ko1FrZsgUtUfA2omODGQWxKRSJko
         3T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102188; x=1691694188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCeP3Zg/H4JeLn+58VLEJaihO4ZmKL3A+bfNY674m9U=;
        b=K7Z4UBkVi93opLOtjEXl1uajfIneFM91UGj2JZBouTAiPqkWdCNgue8xgqJTc9awYc
         1sbmbJbqMLkS/jeDSOUgQrzxvxbDm6W01hRqbk6U8pAxy9j9gZHp5JF80dzl89NcOxmz
         +Q4D3sWaPIUGFd8GMIZbHrpJOeLnUD/BjI2juq6zJpHVsb3K0pOZYPqKjrbHSJhOL3LF
         wK+C5eayo5JcPRksEjLQLFpa/miZqiDz9gc2Qb6kZREeXYOydoXogMk/mBLPQTaBwpOT
         rkh/2eZoKyBnI0FZ8NyXPsWmN7yBdBh7fnsKcScDEDQCXgCWT1faX+wRGwEf+c/mLUDZ
         yWKQ==
X-Gm-Message-State: ABy/qLYgAb7fORVUFW4zs50iJs9Exk3UiWNNPM3aWCalDPqxx6h3+fh1
	eWdILiZYX9MKFRYwtFTA+eE=
X-Google-Smtp-Source: APBJJlGLa9K9eE0tYsTODgWjZkTcPim5nA9Apx+yB+CXJ+4vr5wpBL/QiTp73GJUEV2dLU0j3M4bhw==
X-Received: by 2002:a05:600c:452:b0:3fc:7d2:e0c0 with SMTP id s18-20020a05600c045200b003fc07d2e0c0mr9490361wmb.27.1689102188318;
        Tue, 11 Jul 2023 12:03:08 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003fbb618f7adsm3201286wmi.15.2023.07.11.12.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:03:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Mans Rullgard <mans@mansr.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 1/3] clocksource: sun5i: remove duplication of code and data
Date: Tue, 11 Jul 2023 21:03:06 +0200
Message-ID: <8282256.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20230630201800.16501-2-mans@mansr.com>
References:
 <20230630201800.16501-1-mans@mansr.com>
 <20230630201800.16501-2-mans@mansr.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 30. junij 2023 ob 22:01:26 CEST je Mans Rullgard napisal(a):
> Move the clocksource and clock_event_device structs into the main
> struct sun5i_timer, and update the code for the new layout.  This
> removes a lot of duplication of both code and data.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


