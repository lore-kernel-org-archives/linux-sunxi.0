Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3D1397
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jun 2022 20:45:50 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id kq6so7519085ejb.11
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Jun 2022 13:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SRFzNbjk4H9hinoFoNd44twu7qtxWwrffjJnSc0bRew=;
        b=BZKpQ5ELLmQbihzDjfblTFbGC2I+T9gJ8arG1w0VMdKbXAAnnmiZ+iW+R2L02PTW2M
         mv90XlufKHVTD3JAk2wYcdFjAm4E3CtGP3ozMzcH0OLSRbVXdsMrpM3bPIskZ4s4xD9L
         CDRbrSiAYvxTvTUktVRCyl9t3RUZZ6p3DgUNj9NyYzrsbMMmtpB0+66IUPJhy9QwIvmk
         XMIhDOIU1LFXAA9RGHDAftRrxJ+CtA2vN+RBrw9vhMcwFs/klut9qdhhmTBGOhS0xroS
         wlM07nP7dOmcsxj7XgonqdpPp/HBI9sn6v3ySEYCmhaMJvFjsyLuETT5dlmAEgpiNW0+
         7/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SRFzNbjk4H9hinoFoNd44twu7qtxWwrffjJnSc0bRew=;
        b=xBRoLd4132y43yXTtbIW6dfb56Yo8ZSa8DYWFVkYvE5VVfaT9T6uBnBu5JiAE1Sft2
         Y+kZQSI7hklrwUrvI03RGlbGanYYyYFN3LFLeHtHHG/ViWkpcB2bRRHSNGuF2snifmoN
         77Wgz2BYiQO19GNZX9FHSi1+JnGVAPaKy0vxkUk77utz6YI2ZwM/h0/Pjr4Au7C1pq/f
         61v456DVXAZE3tXlO2A3UsKUJB0QSbdl/fpxOH9eyuJSSnHCD9Ar9Fdpvf7U0/UH2Elu
         lJM5sGLS+/aFBeZ66KdNdFGv6zW4gu4jBvUzs0nQcX6czlgLZgkTBn+arq+/6IxIIvF5
         2i+Q==
X-Gm-Message-State: AOAM530bpr55sERz101spno+rXyaAp7izP00g4r88gjgk5JbDssj7DPP
	STwMgcSh3bVhcXdsHN8hTNo=
X-Google-Smtp-Source: ABdhPJx6y4Mf6UyjG5YD0LqHnRbLlOFbtWpwQxxW3P7Rj517zNQkICgGS1aQFRPvGfRCchZ84/w1cw==
X-Received: by 2002:a17:907:1b05:b0:6f0:18d8:7be0 with SMTP id mp5-20020a1709071b0500b006f018d87be0mr49697018ejc.561.1655066748399;
        Sun, 12 Jun 2022 13:45:48 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906139600b006fec3b2e4f3sm2849499ejc.205.2022.06.12.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 13:45:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] ARM: dts: sunxi: Use constants for RTC clock indexes
Date: Sun, 12 Jun 2022 22:45:47 +0200
Message-ID: <5831557.lOV4Wx5bFT@kista>
In-Reply-To: <20220607012438.18183-1-samuel@sholland.org>
References: <20220607012438.18183-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 07. junij 2022 ob 03:24:37 CEST je Samuel Holland napisal(a):
> The binding header provides descriptive names for the RTC clock indexes,
> since the indexes were arbitrarily chosen by the binding, not by the
> hardware. Let's use the names, so the meaning is clearer.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


