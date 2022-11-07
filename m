Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC10A2F37
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:51:54 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a13so19122368edj.0
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akILfU+YT1llMINpbgikOikRS7jUP0JVY03LJFm+weA=;
        b=UpOC1qkRVlt2Ctk70uMr9xynYyB5jrRklLjfJko+I+KcGHvqHcQ1yo0F3eBiWboAkW
         gNLt9QKMIIQT+N+VyNllglFaA3hxZlLrHiPRTYikVdVz9fSJQqKsqiqrM8JwTxNxQVl5
         z826ksA/yfAJeio2QhgjWN4JZ6DOFL75dVjy/AzBY8WGZsm1JKxi0SgnHGC28TI2bNDz
         CcDTw3GV91ouK3j5Zwkfd1V8WQs/JEqGe8QZiUwA1CctCv52IhCOo7mYUTmjTRJZaO9u
         ZzHbNdchISMosbirY4oOG0ka5eD3te8crOTUoNdCbTsZmwGwEs26ZLZ2WNp7PIFbHRZk
         GpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akILfU+YT1llMINpbgikOikRS7jUP0JVY03LJFm+weA=;
        b=BA+9u2W8pIjusImIKnEBFqIe8unEhQEagyO57zUJgqQ97TGiJPGJZ8o8qoOXAPPEd6
         KlZfGowo68rLi/NAgJ7JRIfAJwEe6mVD57m8gdBUcVJRKDSdUtfUbOnycvq4JJ5Ik6YD
         OqnmWpCLtsyg2PGsFNDAONbui/8A2G9XhY/UkZj2dWhhFQ4FaVi1NyNQkTHqs4O2BgBO
         5NiT4saWrZOv6mT9yGLVNgC5dKsnC4jVoiABewylToW/9GcUUOwoC9RspkTH2/sVomAY
         rHdXkMb87O1624rGIDO/GoHjctrpPQkjqndIO19Hyv2fxCkTJq9ob9pyzoQiDtF6sy+6
         HJDA==
X-Gm-Message-State: ACrzQf3sHFeNruNDj4aU46BF4qszuHM4scM5aGFctfu/c0Z/DsKwuu81
	UCm/TfDufu0yoqtj9mnXCC163JwyLtvIAA==
X-Google-Smtp-Source: AMsMyM73qc/snTrYZAxym8IQqfLO7pQi4KRuVMRzRznlZLQy7C6bYaqqhsqAcch/xVdo/YDzNQGplQ==
X-Received: by 2002:a50:ea81:0:b0:463:6cf1:71ed with SMTP id d1-20020a50ea81000000b004636cf171edmr41381150edo.116.1667847113184;
        Mon, 07 Nov 2022 10:51:53 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709064a1300b007ad9adabcd4sm3714675eju.213.2022.11.07.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:51:52 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 4/5] riscv: dts: allwinner: d1: Add LED controller node
Date: Mon, 07 Nov 2022 19:51:51 +0100
Message-ID: <3642870.MHq7AAxBmi@kista>
In-Reply-To: <20221107053247.1180-5-samuel@sholland.org>
References: <20221107053247.1180-1-samuel@sholland.org> <20221107053247.1180-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 06:32:45 CET je Samuel Holland 
napisal(a):
> Allwinner D1 contains an LED controller. Add its devicetree node, as
> well as the pinmux used by the reference board design.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


