Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D582F2D
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:45:25 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id m21so9846071edc.3
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4q6oMwCm/gTCrJ8zmSnOgEED+29tA9nSZ+RX66hDuE=;
        b=CqWy6eWNskIRB1eU28NVg8geynNqjY6Aoi0d40nKO0fqamMoDMOqYWA1EWLhYEROUN
         XEpiBFCWMXlK5pux/4inKU9j5i3/MQbN5xd29yNgZTKgHWx0x/lwRdR1E6kgcOh1cNNm
         am7xl6rQz05zj6EzgwkhwBDsk1IYk5z67cYNe7PDC9o7aJ8vesUMJZt3FeqeGdBx2oRk
         HGsSA1ztKvWIe800HRszVWa59v9tmh+FIr8ocgaiQ5pqiwsFWgE890/kz01avTeUtH9j
         7he+qpvsuiOeWdxPIzkt3tGOKo4VfnSVLK5MeqNxgqJh74C2O0GtMxhykXPKnAaFwp46
         221w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4q6oMwCm/gTCrJ8zmSnOgEED+29tA9nSZ+RX66hDuE=;
        b=2U0QKJnMAi4ITaZtQkLN1s7ArfprHLQ3sAWMLLLxL9MGoIIcP2MRAn2LQwUob3WOTs
         dsWiwg+iZESJ+CNYcaztky7c7wJokBrayOTYN25DP38cLh6IHgAYlul9q43cyUZxgvZx
         ePkZObNuvXeTUBSI91+Pv/FYBhctNPWIRNLoC0HvjzTJWlAs3uZhzS4eXVJf3GCdOIq1
         MkYAfa1Cbs78m/olMctt10JwxJoOglRzXKK/JxO9H3q74Hm57oFd7x/L+fxIDa2v3VL3
         7SeXfG86pxj8a6DhyseJFUZMO9zmMnx3TVxSUFSjACuXFNtN97HiiVV3IhIwWtpqdR/I
         rFPw==
X-Gm-Message-State: AFqh2kqpgbV2yycwlihoGzEkrd1gaJLDIq7WqCrWwc9EwJjAVyBzVcyz
	/eZ4SksLxl8Y++Yzg1cSInA=
X-Google-Smtp-Source: AMrXdXt7tkRvV/unsvlcOLXlm6E0PeHcJAMS2YvEvKWEeYhUt+Yv9NlwkSHxpJinl7xdfk3BCP0Mzw==
X-Received: by 2002:a05:6402:3887:b0:496:4d2f:1b4b with SMTP id fd7-20020a056402388700b004964d2f1b4bmr8860882edb.7.1673210724121;
        Sun, 08 Jan 2023 12:45:24 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id p24-20020a056402075800b0049668426aa6sm2946544edy.24.2023.01.08.12.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:45:23 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH] ARM: dts: sun8i: h3-beelink-x2: align HDMI CEC node names with
 dtschema
Date: Sun, 08 Jan 2023 21:45:22 +0100
Message-ID: <21769801.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20221204183341.139946-1-krzysztof.kozlowski@linaro.org>
References: <20221204183341.139946-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 04. december 2022 ob 19:33:41 CET je Krzysztof Kozlowski 
napisal(a):
> The bindings expect "cec" for HDMI CEC node.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

Best regards,
Jernej


