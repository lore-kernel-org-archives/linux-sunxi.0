Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC72910F2
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 16:40:58 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso47867221fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691253656; x=1691858456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbgbFpQ5CS8b/Xg24dFI86ayyuiWeSuGucCXchMse2g=;
        b=c+FKwgy+65CRVJA5AJKwke6ZlNOixLM+hZxnft7Tzni9BU8by5Ye/LJcjR2gGI6vVK
         AHGnHGrb5hekJ/uzdt0KNvCkW/nIvxG5CKbhjdSLRSnJfPPZcg7Yo7wyY2feKGSRzDcF
         4vHsPI8W3cK+xasc0WDwMnBcjIdQWfaKbJ+P7/tlZl3XxnNKDbo+hXD/v4ydPa0ICFX1
         0FMnzqNmLlT79FGtHkN+D4l6mViOFIgdZ+4QKFHsmxsQF3tkVS6grXUNICMJ0GjnW5VS
         S9YsACtc/SdqXBxoQAZuGqoO+iF88NgFGMZgX3YP4lLXqyoT1vurhqKpHsEYSEBlrp8C
         IAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691253656; x=1691858456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbgbFpQ5CS8b/Xg24dFI86ayyuiWeSuGucCXchMse2g=;
        b=F/tLVVzr1mTHTo/iIqrMZ0x8ahLdRzfOEAaP9ZmjEmfvJ4nX9JN24rVzaGVe++2xGI
         gobTVcgQifjo58aXjF/MlI1Exhv7m9YPrZ2SJ9L4C2IPzBD06Z1uQDKwSuf2Qw4zZmYz
         vTdvC2m7OAu8eUPVOjXGONaX5eYboa/OSFD/oEiGlK3sc8lxZ4pwsrMldVyWTvsWwWuF
         CLsyjbCZy/tNbSR6US722o4ptIIhUq9wWHWRnLKLIgb+rH2wU+m5ZaCJwGUPk+tsnX/o
         MozESYfeX4OvtVxwm28teH8FHc+RjF9VM/4iqyHeObIA38YDqnOdhM5DUItEdSu9M2m6
         Rv8w==
X-Gm-Message-State: AOJu0Yxe3AIh74l4e0RJ7ojz4ZjxtYcjfeuM84wfcLmf4gY9hB4nJUFi
	S8M4JVlk8ykE178UAAX8ckSw3YP4sFfPQA==
X-Google-Smtp-Source: AGHT+IGAyWnZC1HC2zk0RuQ75eTsYcDjPBSvhuYz3lE2Z9xqqgVdLPS76IkbuMZuD9syyfUlKS6iew==
X-Received: by 2002:a2e:9c9a:0:b0:2b9:ecab:d921 with SMTP id x26-20020a2e9c9a000000b002b9ecabd921mr3847745lji.18.1691253656345;
        Sat, 05 Aug 2023 09:40:56 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c214300b003fe407ca05bsm6762335wml.37.2023.08.05.09.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 09:40:55 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: contact@jookia.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mkl@pengutronix.de,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org,
	wg@grandegger.com
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Sat,  5 Aug 2023 19:40:52 +0300
Message-Id: <20230805164052.669184-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721221552.1973203-4-contact@jookia.org>
References: <20230721221552.1973203-4-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi John, Jernej

On Sat, Jul 22, 2023 at 08:15:51AM +1000, John Watts wrote:
> ...
> @@ -131,6 +131,18 @@ uart3_pb_pins: uart3-pb-pins {
> 				pins = "PB6", "PB7";
> 				function = "uart3";
> 			};
> +
> +			/omit-if-no-ref/
> +			can0_pins: can0-pins {
> +				pins = "PB2", "PB3";
> +				function = "can0";
> +			};
> +
> +			/omit-if-no-ref/
> +			can1_pins: can1-pins {
> +				pins = "PB4", "PB5";
> +				function = "can1";
> +			};
> ...

Should we also keep a pinctrl nodes itself in alphabetical order?
I mean placing a CAN nodes before `clk_pg11_pin` node?
Looks like the other nodes sorted in this way...

Cheers,
Maksim
