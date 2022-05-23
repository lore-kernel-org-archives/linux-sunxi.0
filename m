Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE336C
	for <linux-sunxi@lists.linux.dev>; Mon, 23 May 2022 05:56:26 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id p22so23679359lfo.10
        for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 22:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFQdLCX9WdP+yPd6nXHchy94xL4JXfYcSIxVHAlxh84=;
        b=cxqLRYOWzbhPAgB+pbNrmf+T4+MObrKALcCm26bOPhgPgBEB87xma2YVhQILwOjNCS
         /ExZL673nUmrgljLxB4G0/VG89H+Wh4wXmdKh1Q+5WAO9oYnw8WU/P+XV4JONtPz5QZu
         hrq3TrswKagBGyYW3wN2uLM17sVrh1oPl3PGeBp7wTD1YEzyh7JXtAoWMd7w13v5lUWZ
         6s1OsGJDuYwK/sWU/D/3KsO4qRqxE0Ogzj08qO54oUdgyBYW6PI/HPelzcyAaSX9/+Up
         79Mzbl23Dojxxw0kH6NbNhAO5jksS1j8C27KEgq0dfBzsb0UTI+s0tav1fC7dkcHO4Sr
         1GkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFQdLCX9WdP+yPd6nXHchy94xL4JXfYcSIxVHAlxh84=;
        b=xulwNTe66/gjR3xJKhIxQkgQc8uLmS1+RG2i5M90bIYqM2aZwV0fF7ACa8y5NEcKhC
         x/uUiJdlY4rKXL8OfZarzJ8zzNP2ovjpEZpEWSl8EFg0EQWUWNEadh5/VolyTIouU2xR
         wAxZB6ReIL9d11P/qHUMlaONV/meHaF1nph7kJ7dOve7km5zbcKQ/3afUsT+HAGyr2Pd
         jV2YcemEfBIOIBfDAL/6tndDZbYZ/PtLdhZiHkwcjLR7gjCiHRp2niN16XwACZ1fruOp
         XsJluWZQ4F51S1s6lUOS6/RfPy/JxzsS4vLUOkSZmM+CeY/h07bGGwtcvg2qzFhdPvZi
         vJrg==
X-Gm-Message-State: AOAM533vv2/4VUBb8hmEl87YwWNMUQkzDbv/Px9G75wTH/xkOITUf0zM
	neyAfAhJ61ru6Tf9Gqv6U18=
X-Google-Smtp-Source: ABdhPJzBK+NJFtfLlsJcuiiN3PScqDzAymMZnFlk7yikNWwj/vltqjnSfVU7rHQXqRsXEvJHXS7BUA==
X-Received: by 2002:a05:6512:1112:b0:473:a15b:fdf3 with SMTP id l18-20020a056512111200b00473a15bfdf3mr15130168lfg.155.1653285384501;
        Sun, 22 May 2022 22:56:24 -0700 (PDT)
Received: from ThinkPad-T490.localdomain ([85.143.205.202])
        by smtp.gmail.com with ESMTPSA id v17-20020ac258f1000000b004785060bad6sm1418993lfo.201.2022.05.22.22.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 22:56:24 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: andre.przywara@arm.com
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: arm: dts: sunxi: h3/h5: add gpio-ranges for pio and r_pio
Date: Mon, 23 May 2022 08:55:18 +0300
Message-Id: <20220523055516.270056-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522222630.7faab948@slackpad.lan>
References: <20220522222630.7faab948@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 22 May 2022 22:26:30 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

> But this is somewhat redundant information, because the pinctrl driver
> knows about those values, as they are derived from the big struct
> sunxi_desc_pin definition.
> So wouldn't it be smarter to put a call to
> gpiochip_add_pingroup_range() somewhere into the sunxi pinctrl driver,
> so that it would automatically work for all SoCs?

Sorry, I forgot about the other SoCs. I completely agree with you now.
I will try to fix it in another way.

Thank you, Andre!

Best regards,
Andrei Lalaev
