Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5ED536
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 16:23:26 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id m18so91035285eji.5
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 08:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgX3Uq5RN2gSxMD0FpAihmi52pqkCtembnImF2lZd1A=;
        b=XFAeuZZdm8oGXFYrt5K0AoexBXXG2KNww0ztHS62JWbcYMzvrdcqh9P7MNMkmwpSXe
         e1Yc2oL9WFlKdi5wtL9ykg8RMH4kmfoGMXKu72j8Q+qHM0eegIIGDkHIzP0v7sYrxG8o
         vjvO6GTte4j/hbWJTqoPwNEF3ozWP7RGVmRiyFDTIDwljpOuzFINcD0Z8vZNWP73NA+P
         RGdO5qPeChj1sEMPKsFHBksQxZQ1mq/Mdw9rQNN2gFOr2BYhp7u0QgScLQSYxqeenecd
         96IzbF8onkkIRmBIOyrNkY9caesvf+7yD6U/OLyjkoNEo160doio/yrlxo6aGDkH55K3
         bp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgX3Uq5RN2gSxMD0FpAihmi52pqkCtembnImF2lZd1A=;
        b=oeeJEnjUpwLfPBoMy18152AULX+YRMP6rJj/4czcbvJYysiFVkk0DvzVaFXWGD367n
         po/BhQvzlqAhazKTmEFJ7C5jTAc1cKvVhEnl3C8zxgb0qUviaUolw6IjxQJLINgko90X
         zIrkXo/oeKA9Jx8hd8nVFxBcs3gjIfmmPRoLOFSJOWHZTv8sJZQPlFlbTW4h9PQKd/3u
         WfXj05OnxuNwv8An0Ll0tB1COc6V34vjVHc+jqc+N6oF2C8E6OEi+jBqBy8T7Ok4zplM
         Mi+6aIkDdvtt5M4YOhIERj9suZFP3WxJMjK8z2+S6nubLb6GOf4WDXKRiiv+OmEQd4f7
         TTBg==
X-Gm-Message-State: AFqh2kpbODSv9gtyAcUOdXvyOfIla0zHuMspDnbxUv9zEhk1zhZTfhck
	6rG4cI7uHQz+4pq2mhM+Zjg=
X-Google-Smtp-Source: AMrXdXs6L27C/xjKuud7Vz8JTA95Nlc31IiajcsXqJwmfmirq1LtYT1Mbix+2eKxiqVBCANKMzF8mA==
X-Received: by 2002:a17:906:1c59:b0:7bb:af66:f38c with SMTP id l25-20020a1709061c5900b007bbaf66f38cmr45192698ejg.10.1672935804845;
        Thu, 05 Jan 2023 08:23:24 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709061db100b0084c70c27407sm11121630ejh.84.2023.01.05.08.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:23:23 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/2] ARM: dts: sunxi: Fix GPIO LED node names
Date: Thu, 05 Jan 2023 17:23:22 +0100
Message-ID: <2126880.irdbgypaU6@jernej-laptop>
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

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


