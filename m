Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55FA33C9
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 11:20:45 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id c18so4930456ple.11
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 04:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679052045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MwLiXEkSoODfLPV/T7b8EOfk9wVIiqqUoC/gH53lWZU=;
        b=Ttm6IQgPtKVqW35fvUeY6VXzeem1vkYZOaz7vrKbqQj84Ey4plajxvY5qeVS5aAce6
         Xkwcd0olSVfA/Pt70m1P4G+S5TwoKQ6+En8w3Y9Zhaa534QbBM3pGw8FoxdHQYCpzPEm
         vDXQlV0DA2NaGBjJhZz2svDF7liaMLdMlcxGLHBo4mcBGWLVug4R8MBTr0IqaK3zd8wM
         /UIyPPMOjC1Kbgst4AaM+SJvN3kd9EKEh1VLPosb4D8m8bBzlbU4xfabzadoAygf9A8j
         I8oxYJJT3O4GiOf+6Y5mAYH/yqbI46z+dKEdO4LS4O6A8QL/Huv9sMoxrmSm7x8crldR
         vYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwLiXEkSoODfLPV/T7b8EOfk9wVIiqqUoC/gH53lWZU=;
        b=iq08bWr5x/AUH79sUGli3mLOAtIwX2hfcTlNdQu0G/Xf4K9F5cC9EI9gp/FBNl/PEO
         KPVW50oLFXw73uybYmcWrMDdmHRwGkAO1fG/YZv2zrZlJ/pjuEvzZlByEbsIC0/i2gkQ
         ev5VkkTA6OnDv/lBoMQZcfbDcEjf3MH3/SxOtrsLopcrPy9urB11HgSbik/tcBu0QIfY
         r9DcbLWTs4qLPXd0ok0jZsy4axRBYESSekpxkCzj398jPXp9lKTgF3ZrKAJF8QNxtz57
         ElnFIYYv/H+AKKFez6p4bUwF2GDa1acsDC78y0WYsDq6ooy2lOubDg4LRqv8kCao6qVW
         1+fQ==
X-Gm-Message-State: AO0yUKUmKuDjDNUibpu1PJesRB8czqNqEOdZi0CBvKwp8zSgHeOtl0S2
	41MAoxzQX02dIsDvPzrH5VM=
X-Google-Smtp-Source: AK7set/62xLpYpXgwN2rSkGaoIOTq1VB0W8uBipmcDV+jPGswnD5z5uLk5Q3AY0HOm7fAjS0AE5Faw==
X-Received: by 2002:a17:902:d2c7:b0:19a:a520:b203 with SMTP id n7-20020a170902d2c700b0019aa520b203mr8979837plc.25.1679052045382;
        Fri, 17 Mar 2023 04:20:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d084:8252:e846:af61])
        by smtp.gmail.com with ESMTPSA id iw21-20020a170903045500b0019aa8149cb9sm1353820plb.79.2023.03.17.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:20:44 -0700 (PDT)
Date: Fri, 17 Mar 2023 04:20:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/4] Input: bcm_iproc_tsc: drop of_match_ptr for ID table
Message-ID: <ZBRNCbrpzfy35mdO@google.com>
References: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
 <20230312131514.351603-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312131514.351603-4-krzysztof.kozlowski@linaro.org>

On Sun, Mar 12, 2023 at 02:15:14PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
