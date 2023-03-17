Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76F33C9
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 11:19:57 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id a16so396401pjs.4
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679051997;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0QpTAcEGna+yl0Brgjs6Bn1Df3Qs/JcBmXdFEtNXC5g=;
        b=YZg9RHZNhV9AbpV23NNl/0lXMU+MUi9FN4QqL+Hb4nrSE0HrJLNi2MTjtmBkjepaB8
         v4pBAwLPxRthKYBdqWp9Tnzd78Vzct8z7dLJK/5X1tsAtYUNAskzND0Pyg9IcV24AJ9G
         3R0Z6QZso3IjfPyJC03m7PiTKDPGS0znxpOsKsUfJaZpv9JqnKPsBPxkXs3RroV4FN1S
         5EZcSw7XsrVSdJ5alGdVwwaSsRUFOvPR79O1Yz1LEeHVPPVsmeNb1rsfuYS9fAO5l++j
         ACokctnNgoW3iLl140V4Av989j42K3OPilWswUJhH/zyMzwqzhiaBvc2tEHkN4Fk6d55
         rY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679051997;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QpTAcEGna+yl0Brgjs6Bn1Df3Qs/JcBmXdFEtNXC5g=;
        b=D4xTnPc6Y2Q1JdiiDKMvE1p2eDDWBJl1FMRvhDJ2drAQEJNktB3aOKkhy0MYCP/NgD
         XYDtT0iw4MAx52ma7eQd1q1nkhCze5t1pdBkE3zj1K+AK6xRR6wqUoXd5ge0nWN5xz5o
         MFCloikzN1W2HRX/EEgpOSnLiIRL8CDryP1Z5PfS4bsPTZrW493Mt5GroMPU42YSJ7Ef
         gCHZX9gLh4XYwHpNl6qd8UE264n3o22o/e3OtG3s1r6O3zvbbr169pHsz5VTqhYaUTpf
         0w8iqP9s0X3veKL3JhbJQx9Kr8AhY5e+rLJ3EUVnvtaG8Kr1AlYjrOg7clAV/3Q8jrzO
         nzPg==
X-Gm-Message-State: AO0yUKUoYEyEzC+El4jpraHQZl4DxPyfTh9KhG9yBjZsDqmgT3GIs+5z
	xjq/PtkpMO71WlHH2VbF0ZE=
X-Google-Smtp-Source: AK7set8LcvpwH/OcfmOgBd9z/URO4reQNgW2quausnEUb7s/x7XYAMDRnIMNlLgalnJzoLZoQJxJsA==
X-Received: by 2002:a17:902:dacf:b0:19d:62b:f040 with SMTP id q15-20020a170902dacf00b0019d062bf040mr8295103plx.37.1679051997006;
        Fri, 17 Mar 2023 04:19:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d084:8252:e846:af61])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b0019cad2de86bsm1329122pli.156.2023.03.17.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:19:56 -0700 (PDT)
Date: Fri, 17 Mar 2023 04:19:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] Input: st-keyscan: drop of_match_ptr for ID table
Message-ID: <ZBRM2GPgh9u5PJaS@google.com>
References: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>

On Sun, Mar 12, 2023 at 02:15:11PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
> 
>   drivers/input/keyboard/st-keyscan.c:251:34: error: ‘keyscan_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
