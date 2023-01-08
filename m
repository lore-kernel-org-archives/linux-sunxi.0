Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786751859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 21:03:04 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ud5so15605707ejc.4
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 13:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WLT5A0J6hO3d4KVLI6EF1C1Wnk0AtqyO6OnmLJxI90=;
        b=aXufoqzsAilrFysDcJVYURLOcCAxf1e3KrQ53HuICGeBBXDSetVZ3ZrdyrU6rwW4jb
         7VrHlw014i0GhnrB7Tij+EbJytkzzNSDf+0Qnm6yls9GMoM6qvXH0oxgGapOTtVBTAId
         U7nvcpQ74hwlKGOcebnQLfsAwba5sCc4vHaTu2zBEE5nyGNlhRGJbA0k3+FEko1trhe4
         y7t3JFk0up3uKGJBqP5xYVxaz1r4uEs6UQc0SmndWUcx76wNuFObyJFDg7o6YhqIhTpb
         2CHpERTyTqzvMrGHOma7mY0T3F0By3DkKqIEqCHLuJAVii7zi+EQ2CVHF5h1LvvbwdQw
         W8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WLT5A0J6hO3d4KVLI6EF1C1Wnk0AtqyO6OnmLJxI90=;
        b=wCOa4JWjIhVMm97PXvDpb7rhb4+Fl35cPK/7hf83/TCGHvJMFZDQTLHUyFd2thwpJT
         uHxYJq/8CXwtSeqStWoKepPsgfJoDcbzXm5GNSmsqenkx180oSue5ZqmcMCzjRlWjts2
         0NuDJaWfFPzyvrMso9YXlZNCBj6sYIwRGx07CFBJCHekegn0lpGd6M3EyBha4XPk4aOY
         hS9ldPzxidAYs7/CRzGbh056iSKLCcLx1cNqITZj5UOde+8uZK7IUirIygXreh5wIBUy
         2VdeTboQ9cT/MKy6WN+3+67lNvCnt4S9P63lL7lvxmBrq8er3bfyg12bqhHIBpzXbLrl
         fGeg==
X-Gm-Message-State: AFqh2ko59vhyxecr+7SWV+WzmFJry6BjYvBfx8CTpBIGgHu5kKc5RnKO
	Xs+1NdUUFwapAWKgGxKkZHg=
X-Google-Smtp-Source: AMrXdXvLb84qUoRiC4Q8ySgquZqxigGYSzUI/z915ir8dQbQIl+fouYy8pcNuXgmYMRPC2mPwWmrtw==
X-Received: by 2002:a17:907:7da4:b0:78d:f455:b5dc with SMTP id oz36-20020a1709077da400b0078df455b5dcmr65634196ejc.28.1673211782779;
        Sun, 08 Jan 2023 13:03:02 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b0084c723a626csm2877680ejh.209.2023.01.08.13.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:03:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/2] ARM: dts: sunxi: Fix GPIO LED node names
Date: Sun, 08 Jan 2023 22:03:01 +0100
Message-ID: <22960501.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20221231225854.16320-1-samuel@sholland.org>
References: <20221231225854.16320-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 31. december 2022 ob 23:58:53 CET je Samuel Holland napisal(a):
> These board devicetrees fail to validate because the gpio-leds schema
> requires its child nodes to have "led" in the node name.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied both, thanks!

Best regards,
Jernej


