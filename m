Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8792B1C11
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 16:57:56 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id j6so7568867qvn.12
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibt+O2tRTC+XLIJvsYeu+FwATyn84kd6eVFxBJYzFqM=;
        b=BTzNOwChQMX8aKTW8AI8KKHYOGvdjHDW8bs74afSFW+xfiuTfWaa7zu8WTbINDkaD4
         sacwNqHHcvHGRwFKZzkSEnZhaRF9XyB7XoPlvukfhFwOQtzQJlDqO2G2FaWeJpwLV3VL
         MHvXp54waZ77Jh6Jp1VIEc51r1zlNiWNr6RghPY//tCIZ09YBYBq+DNeVCcw2wwJbHKx
         r8jaE+q5U9Q+9JNVRlCmRD+ryXZ7KUeyRpSR5BV1/oGBnZZtbtWF7MtWWhx7IKcZo+Pv
         nyfwXH1bTbiHDmXg/sRacdyxDlOIT/Dnp/xkDZSKk50e0tjh1tNkJ4Qm1ZSEZ2HWHKLP
         SroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibt+O2tRTC+XLIJvsYeu+FwATyn84kd6eVFxBJYzFqM=;
        b=yKOZLyjl1sjPnyOQId7IMKDY+mUOuz91NGTJ3TYjWsQnBS15zDy/OMqmMvZp3DSiFd
         Ktzk88UAHF7/YiSVedaK55OodHt4O2XuIW/wvOJmtQusLSlL+e24eMQPa8ihwgGslo4K
         CVpy67wJztKdSGZpy7YXDDifCcW+VGOX1nFFIa2vf/YxOmLTvOkRf7xS7KKP//ZArc8W
         akYa7Ikg0FmhRxqmnxmoNAkuAPjr8+nM1fgmVoZ8+VOjZ1PMU16gy0jV+OpkIU/FzIW7
         ZMKKEjRjPrB7Lrt8p5dLPGp8TOlafGqafOTzWgDmWZMLM36T08qDQLhw6GFXHRs8oGTS
         KJUQ==
X-Gm-Message-State: ACrzQf15Yb9wKH/QTAXZkI0rEVnNC95+dzF4XaPxID+HuKS7UwRuDMqe
	YzfkI/IheHNwQlwlp8hSCSgsXw==
X-Google-Smtp-Source: AMsMyM4ACU6ItJBe0wOukiBoP1PRtSubMbeaD1Eftx7piknoX9MXlQ6HV64ZJCRcvGJWxMvUX3E9VA==
X-Received: by 2002:ad4:4ea7:0:b0:4b9:365b:2a86 with SMTP id ed7-20020ad44ea7000000b004b9365b2a86mr27663607qvb.58.1666803475559;
        Wed, 26 Oct 2022 09:57:55 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id g21-20020a05620a40d500b006ee8874f5fasm4360759qko.53.2022.10.26.09.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 09:57:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] ARM: dts: sunxi: correct indentation
Date: Wed, 26 Oct 2022 12:57:44 -0400
Message-Id: <166680346262.49767.5734726885417469609.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002091959.68815-1-krzysztof.kozlowski@linaro.org>
References: <20221002091959.68815-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 2 Oct 2022 11:19:59 +0200, Krzysztof Kozlowski wrote:
> Do not use spaces for indentation.
> 
> 

Applied, thanks!

[1/1] ARM: dts: sunxi: correct indentation
      https://git.kernel.org/krzk/linux-dt/c/2970b5ee2e7d642da306827fd8257fa18ea9c09f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
