Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6CA2F37
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 19:12:25 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id a67so19121634edf.12
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 11:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvL/1cFUsL3p3X3LC8k460k8YFidRmeQtOlvn66hT5c=;
        b=L9KbpQy8GmRLe8WezLbdNadTVnX1iELu6qPXRgi3FtSkeS0cHYjxUbwxxhZUjAXf2r
         YRUfcgA7jrgfDAt5yq7E5hqv/euUeQLaatyYF8+YCPrSvwCDp9VhLFc28vUZpPhJkFM/
         U3SDwV32EgkskScgs/pchyFeDu87L77tn1oCQ79pJ6hw8TcbTTQh84B1jVXetPfvKQa9
         YMai1q8Vf8taf9Ktlj9UYdMX7RncfGQA0Y/w6N/ro8+pqGhMdMfPLFkmrAil3kRsqKuK
         /MJOKF6KPvb/ygCKsZcJ5H9CBY9FkLBEbK94pPqKhK9BoJJfnsY7vKjawhV6zTtAqsAJ
         LvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvL/1cFUsL3p3X3LC8k460k8YFidRmeQtOlvn66hT5c=;
        b=TBR+rD57tquIC4DDh32bCJgRLop6QeKSwSCYdAx7iFIkSU941iXBse45kJ7DKGzc3x
         Sf2W6cR8UT8SrrGjWqwnC3j8s3EgQRr/6Qd0W6iAcQ5Fzkmepl0L0g/bTKcr6n/MJFrX
         HKAjoxb7JGZ8tgVyP0pGNbqqdwfaLEhqrJtjygw4DgFiL/BsO5cPEU+Wrhk4a5oh4C7X
         EJyglrZrjlKUz8OvnU6XMAbUUe7FCmKNsQgYsaWcIpeQGKowdy9hMFM5uuNmXc7cclnw
         T0UUZzJ861WXaPrO+TMGnLJ4ec9Uz8SM8wZ0kyADG/kgYI+LIwLyxReE6HuzlKiOTZ+m
         EXpA==
X-Gm-Message-State: ACrzQf0ibH9WKf8HboDu4GNJAyOZ/epvTFPSb/VGVDPuZWWl5jY5oyCy
	qVmVY2aCS2GP53JoC5NWktA=
X-Google-Smtp-Source: AMsMyM45BewjPXyzYPbE2qLoXyx+2V33Q8EG3+MjSy4qWA1xQl9O/BIF27MyIvjPTTeXeOK2sXCBLA==
X-Received: by 2002:a05:6402:1052:b0:459:2c49:1aed with SMTP id e18-20020a056402105200b004592c491aedmr51731588edu.212.1667848343564;
        Mon, 07 Nov 2022 11:12:23 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id o17-20020a170906601100b0073d83f80b05sm3790021ejj.94.2022.11.07.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:12:23 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Bastian Germann <bage@debian.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Bastian Germann <bage@debian.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: allwinner: a64: enable Bluetooth on Pinebook
Date: Mon, 07 Nov 2022 20:12:22 +0100
Message-ID: <2320960.NG923GbCHz@kista>
In-Reply-To: <20221105153319.19345-2-bage@debian.org>
References: <20221105153319.19345-1-bage@debian.org> <20221105153319.19345-2-bage@debian.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 05. november 2022 ob 16:33:19 CET je Bastian Germann napisal(a):
> From: Vasily Khoruzhick <anarsoul@gmail.com>
> 
> Pinebook has an RTL8723CS WiFi + BT chip. BT is connected to UART1
> and uses PL5 as device wake GPIO and PL6 as host wake GPIO.
> 
> Enable it in the device tree.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Signed-off-by: Bastian Germann <bage@debian.org>

Applied, thanks!

Best regards,
Jernej


