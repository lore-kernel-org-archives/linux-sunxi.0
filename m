Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6433C9
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 11:20:25 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id u20so2420351pfk.12
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679052025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KH3sDhveeP+HgjB/MBfU5c/5KaPz4VTPorwSz2k9Oik=;
        b=lJUscY2d4a6HncL6cbFB7bK+fd9kDlRHz42ieVf54xv45lC5bbYAFwzknil9nBDR3P
         FJpGUt/rw3YidoDR/0LNahaxQA5SbhZFXG0F1F7+Z/m1i8PTKuy6fcyBFGQlanCk7UOI
         2/UfAmdZi0m2zTmkSB2BWhrM1VSmxs2eqENG0UH2bFDzfxpptr47YmIT9mWUCbjQmOXw
         fn3o4lEc207zPD7qA9b2wkjlFkvNOmxrL46A7quJaYNgArArsN6iav+pbfxvpTmkPvRF
         TnNrACWIRef+zSPOGveRJRO5xGjp6Sd7tYAEZ6P83E4Au29bi03AOp65pJkFyS+G2cqx
         ZBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KH3sDhveeP+HgjB/MBfU5c/5KaPz4VTPorwSz2k9Oik=;
        b=7DXrFpoMa8b+oLMEEUq11e1HuhgUGJa9UvOf9iqaBPqxw5R/8Wr2NDsJ6QR78sHGqZ
         P6UbIW1PQAaQjf2yuB4vkBc2bJm5B6q5nkHWtZCBCR/wZ4u7qdynSgDkXLsdBLRz44uc
         Q1Qz7cWxc7pyFzjta72S7ev6V+7GzmR+5V43UfZ/JjT44EmNaRqAWnuT7ew/OEQtzN4X
         fWnhE+uwEMn+p+bsByfzrOfE/XyOrQR1GVSREpw/5mSKuH3I+THugB/tH+h486VOOged
         FB0PzUmGLcbLqBKcPNrODWg7KY79d7LleKCHScNOzXErA66I0iHJ8kxvzXdXG6LpHoAb
         azGw==
X-Gm-Message-State: AO0yUKWx4rD1NkZVKm6R75tQOgpLWEqyZlPwzO8U7t9NSP4bZXDlQ0Vw
	vu2/uN+ktHi92Pfg5osyIko=
X-Google-Smtp-Source: AK7set8S3IgT90Iwi4OgXWmUJoFTXB0GAENTgqr+iLtDA+giTAnJ48TQtwwhBFwxNP9uDYoSzQ9lFA==
X-Received: by 2002:a62:7910:0:b0:626:248d:4ece with SMTP id u16-20020a627910000000b00626248d4ecemr1879513pfc.30.1679052025033;
        Fri, 17 Mar 2023 04:20:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d084:8252:e846:af61])
        by smtp.gmail.com with ESMTPSA id x5-20020aa79185000000b0062612b97cfdsm1323540pfa.123.2023.03.17.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:20:24 -0700 (PDT)
Date: Fri, 17 Mar 2023 04:20:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] Input: sun4i-ts: drop of_match_ptr for ID table
Message-ID: <ZBRM9KV9nDnjao/D@google.com>
References: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
 <20230312131514.351603-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131514.351603-3-krzysztof.kozlowski@linaro.org>

On Sun, Mar 12, 2023 at 02:15:13PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
> 
>   drivers/input/touchscreen/sun4i-ts.c:392:34: error: ‘sun4i_ts_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
