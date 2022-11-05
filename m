Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048A7C
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Nov 2022 21:07:24 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id d26so21281211eje.10
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Nov 2022 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs1jDi6MDHgTf1jm542+fLUkEHEfEymUM9i9SJMIuQs=;
        b=EU83VSr+4f/dRzu7BrHWHuC+FZM+vpOUF3haqKM6eGmSAXu+USRthwUd9L62hX1cCL
         UWgXG2sgyxjp6mZcQzSXYw1KjqBoo2nESeGQAdqU5cSLU3bk3BfGi1bFo26+cmFRL+LI
         dt3ftM2HquC67CEFOjCaoalWoVLJz9CmbpWnNayQtQgHdeWDDBu/VpbD/LMwja7YurXZ
         bnf2e970QhC9bFcje8zNjfvjBSuvnrYAiQamOXh9i3FQ2/0gmiRWdlvdkU34KsemKyn6
         P4/X3MGgAssww5hS3JLFzW11uALuf1AF0bTorit9RMT0gsxuQF4fBzowfnc+q8fNnrgi
         3OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs1jDi6MDHgTf1jm542+fLUkEHEfEymUM9i9SJMIuQs=;
        b=oPCagAxD/x8FjOPfd3Rn9Pm/0FZY3+axZwzZ3Nx/5ZqPwnaD40JKFc8rHn919iBDjQ
         r+lmGdc81aA+8pXeC3QJtfFlnjBzJdzf0bHnwD2SwCyU/JwhDZbusJ1WDJh33fsY+4M2
         KKhJ9dXC3qAsKHYsuueZXlZzWiK5N59rLWiMrsPR4pUTWlDeBChdB7+gZNL4zKEKXL6G
         MT+K/Z1SPMHx5ZyRt/l9l0Dl71cABzML11NRzw9SmbLXHq1iM+zXY5INA5pbAbX0nYE1
         m9rXAXfqEDkY/3bAGFo0tAqCawAHDxWTiu84DI33DXpSy7BMq+YOO21KhFtO6vbibFmR
         xBpg==
X-Gm-Message-State: ACrzQf1jWXVCZhAQa1plbvJx4eWEFSV+l17VlydM9JN5BbWKB4r36jHo
	JNBmwipeEecC+VjBReaDOYw=
X-Google-Smtp-Source: AMsMyM4qnYaEHN9tm9Dx5kAMHo2UAPkX2VxnU3giaRhnRkxPmcavexaDdSZAyj2UDFCzgEehUeRyeg==
X-Received: by 2002:a17:907:a067:b0:7a7:dc5e:eb2d with SMTP id ia7-20020a170907a06700b007a7dc5eeb2dmr41564881ejc.121.1667682442717;
        Sat, 05 Nov 2022 14:07:22 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id x19-20020a170906711300b0078116c361d9sm1378095ejj.10.2022.11.05.14.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:07:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 5/7] arm64: dts: allwinner: h616: Add USB nodes
Date: Sat, 05 Nov 2022 22:07:20 +0100
Message-ID: <2120022.irdbgypaU6@jernej-laptop>
In-Reply-To: <20221031111358.3387297-6-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com> <20221031111358.3387297-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 31. oktober 2022 ob 12:13:56 CET je Andre Przywara napisal(a):
> Add the nodes for the MUSB and the four USB host controllers to the SoC
> .dtsi, along with the PHY node needed to bind all of them together.
> 
> EHCI/OHCI and MUSB are compatible to previous SoCs, but the PHY requires
> some quirks (handled in the driver).
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


