Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFD0122A7
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:47:00 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id i21so19025276edj.10
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k9MmuI1MvMCM4kW5q5UZ7eFYSW9HVmxbOqfeTnNIVQ=;
        b=LRsYyTRaV4jafpX+zpnW8OS59zf+/7sj1d0JukdUCJqQLqq1taC5fxBB57pHK+n5Dv
         cimzGiZgMO2ABdiuEEB4EfE72tkL6TaQG1q67coXEvtWBW5KsZFZtN/x3jXDeNRQp7yK
         W7s+U6gyNo3qxYwo/1QxCRoW1NzkrKP+lrh3y6GvOixtF3ouonMArMCgVJ7Yymtg7GDA
         1oxMYGgkk04WQSJYD6wNci85CTuBX8i1i2Xw5lKMA92Lzg44v6z15+Bqm94eg51xEYU/
         DNA2BF9wWujsCUXArzAqNb8Y0CjvQhpFv2WLFsoykGR/4H+HGsZwgYHI6k6Fy0XvzpAr
         gFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4k9MmuI1MvMCM4kW5q5UZ7eFYSW9HVmxbOqfeTnNIVQ=;
        b=zHNWQmgkeDFuJ/PMzmaSssgy+TtUag6FNwjgVFcNdkXxIXpttjEOlZD5eyAQBUyUZJ
         2zxkYvpX8NKxF0Twk+QyEouxFwnhE9DqhS6JptRgyCUXNvWJfn9WTIhPOEsX4+4Vs+zK
         2iKuNETfwyqND2X8BOOFXZqMK9oJz1r6X9JOBJ6SJPtPeSptqqC3/WCQDe8XsfIztmku
         vXzed1HvKMaOu0zD6v58Xn8I3AaV46c9P8HEGODQ5CJpVAxRG/umvc1oJkcVDJgrABCP
         v6i1pip0ugVM7kg6QUfxA/B7BgG+QQczNxZf5Op0YfwN+mBTujQhz5eKI+FFst0+upef
         ZKbg==
X-Gm-Message-State: ACrzQf1+qGWThGjla2MYIKnJiuGWsnhjnFKcVHXXfWfrufto2wUxZSI2
	MhSE4uyzzXYB1SzeY7AXrGU=
X-Google-Smtp-Source: AMsMyM4nS36bVi8dvIU8Iq8ikvl6ojIMfWP3tkRXBU2SONRFQSJULPnsy557+rQe/FykE+cRNr7Gdg==
X-Received: by 2002:a05:6402:517c:b0:461:e7e7:c0b9 with SMTP id d28-20020a056402517c00b00461e7e7c0b9mr50272788ede.73.1667846819206;
        Mon, 07 Nov 2022 10:46:59 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id w23-20020aa7dcd7000000b00443d657d8a4sm4534499edu.61.2022.11.07.10.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:46:58 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: a100: Add LED controller node
Date: Mon, 07 Nov 2022 19:46:57 +0100
Message-ID: <2128638.Mh6RI2rZIc@kista>
In-Reply-To: <20221107053247.1180-4-samuel@sholland.org>
References: <20221107053247.1180-1-samuel@sholland.org> <20221107053247.1180-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 06:32:44 CET je Samuel Holland 
napisal(a):
> Allwinner A100 contains an LED controller. Add it to the devicetree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


