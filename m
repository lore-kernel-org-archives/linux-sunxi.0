Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC14404
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 18:49:37 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fw3so9578177ejc.10
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 11:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CdAV/6GUNOpdTz1C7hAmWiCc9fjEGHw3vQkBTwxBEOY=;
        b=FMn02QLmEMmkl/6gZP3RKuRZJVWU68THnsRAGKmQHz8Lrr00VWn01EGbtZhub1l4Ob
         i2WDfca2lqmi1irUTtYplzgqAMyoEL9tMGaMXYyloftE8yo7Ok/PikbVJ9i/6SqNMWsR
         ZeFjcT6CALaYjBnhwBrmmmj1++iwEx+fJe/9APaRMTKQ1zUfT19P8jgM7ZzTnPCPd5WF
         IlNHUyfy7xHp+UY7UjCEoZ11C7OvrvUvOf0FpAFe2nxVISTeekw46owJLp0kyNLQDRbn
         dqo1gGen8dZBgXXu+yCiugWtib4sJ6dzmzE2M3Th85POv3ZXQT7JMotp//zSTD8q3Tsu
         q79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CdAV/6GUNOpdTz1C7hAmWiCc9fjEGHw3vQkBTwxBEOY=;
        b=dRR6ajGMtjrM6f0mK7W4HZqGz4hxSujoBeQDcU8gEEWCfdTdKHWc3C4V4f0ffGqBD/
         zKpNOMF4HKMeHSHDvYnQLFNOV9194te3Ci3JMz2SyBkmyUdghwvYyFL+nY+X2P5aU2ez
         8GsS6RP8ffnt4LaPMAVLo9vLbBRdMpMTv8F5f79816G0oiV8EBMnYjRRrm913PgoFyJQ
         UGHZtsrs4PzASIz6YyRInxlAZNaO94cl2Ep7pAz0ECq3YSM2E3FWKNynu5/SHY26l88I
         ETehy5mtwua03AtE1dinKYTYoPOi5cQvEaSiNW+JOzKO7+WyV+GFLSm1pZ8I4qdx4A8U
         y8Iw==
X-Gm-Message-State: AJIora9h4ym4g7PF9cjEQu0E4rOK99niVnwCTAXENA6t4d8XFlnrDdll
	R3zKrM5tYiPdHaTS+GtxuaLueQgL+Mc=
X-Google-Smtp-Source: AGRyM1tenYnX0HVtR56fkd/R+fWFRKkwPnmcJxGhx2/merGL3RJjmFBCmigs2vqU63stKLD9E04ysw==
X-Received: by 2002:a17:906:4fd4:b0:722:f223:8d86 with SMTP id i20-20020a1709064fd400b00722f2238d86mr20538747ejw.558.1656787776015;
        Sat, 02 Jul 2022 11:49:36 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id p19-20020aa7cc93000000b0042bdb6a3602sm16927232edt.69.2022.07.02.11.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 11:49:35 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee.jones@linaro.org>, Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: sun6i-prcm: Update Kconfig description
Date: Sat, 02 Jul 2022 20:49:34 +0200
Message-ID: <10103142.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20220702184044.51144-1-samuel@sholland.org>
References: <20220702184044.51144-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 20:40:43 CEST je Samuel Holland napisal(a):
> This driver is used by a specific range of SoCs between when the PRCM
> hardware was introduced (A31) and when the PRCM CCU driver was added
> (A83T). It is unlikely to be extended to additional hardware. Update
> the description to include the full list of applicable SoCs.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


