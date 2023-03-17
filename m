Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD83333C9
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 11:20:10 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id k2so4943080pll.8
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679052010;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LUsFZcElnirxMxsGWtP7RpSM3YXWjq7ve24NpjNKOq4=;
        b=ciczQQTdLiTc+HUCmmexi03FzlaRtMQGL18B7mO7Hq8hZFnn/xcgnVIlZP1IcGIY0G
         yWUuxuH85wIKkiFfQYkCxR3UUpKJZvAC/CUK1tdNSQ3y0LVfArFj1w1yDhciKsFWKP5+
         gvgvGXUlm3sfuK0J3eLG1AD6f59ECtjWIy3ygCKErSpNbxcZQFtg5n16Mm+v7/83OvVi
         cvt1M0/Pfr+2Fe9mzDwXetgSZXCTmNqq3EPawocTbkYT3eZ6m6/xccPjitzWR9zaHRJW
         JUsAck+XGGz57+s6BgWJLJkUcfXUImEkUHbbJ0EJyKDINWt6f30XQgVM9Q0cSMQuvbOH
         n8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052010;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUsFZcElnirxMxsGWtP7RpSM3YXWjq7ve24NpjNKOq4=;
        b=Z3igPZg0Y33gIfttNJfVfPQ3GDldtHhHMhFv/nPEr1uGQytte6pDe/zuWbqwDDCYCD
         skEUHG5SxUuiXZCsBzEIEOplaN/PmSUswp/rwsvrHjrS+jAoxc2u3sQLEvkDNTEDXYR0
         wGE1cDxzSMFgq6S4x8qLy4IYrqMYHeU87RpxGQwdZyLa0JIb8M7M1RpSQbQ/dC1CA+um
         8cXUSjuWphioYxYv3PC1Mo+ASPYNLmAezanFkDawVGdX9mlwSRKR8BQAPFAs4cbqtrJ0
         trEAlmk9gAfakoOJmOTqAjfxQfzyc2QS/qvnTBqJVbd93jIyE2W/DinWMHeF7T6HC2CR
         4PRg==
X-Gm-Message-State: AO0yUKXpqMYRQsugbfleJ7L+N29u98daq8U6xsrV0VTmx4Xe4wBFK+Dp
	Wr6zrXsiq0BkPa+7nJ6zAic=
X-Google-Smtp-Source: AK7set+cnEYFS/OwqzUJQae17ZAKvPAAq2PqJq+ey3hbHNcnG3FI0vSYRDvIEbGSDE3UZCfx+Tnbvg==
X-Received: by 2002:a17:90b:4d86:b0:23d:5196:eca8 with SMTP id oj6-20020a17090b4d8600b0023d5196eca8mr7890564pjb.20.1679052010159;
        Fri, 17 Mar 2023 04:20:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d084:8252:e846:af61])
        by smtp.gmail.com with ESMTPSA id ca20-20020a17090af31400b00233d6547000sm1187175pjb.54.2023.03.17.04.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:20:09 -0700 (PDT)
Date: Fri, 17 Mar 2023 04:20:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/4] Input: tm2-touchkey: drop of_match_ptr for ID table
Message-ID: <ZBRM5oAoJc/3sUaw@google.com>
References: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
 <20230312131514.351603-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131514.351603-2-krzysztof.kozlowski@linaro.org>

On Sun, Mar 12, 2023 at 02:15:12PM +0100, Krzysztof Kozlowski wrote:
> The driver will match mostly by DT table (even thought there is regular
> ID table) so there is little benefit in of_match_ptr (this also allows
> ACPI matching via PRP0001, even though it might not be relevant here).
> This also fixes !CONFIG_OF error:
> 
>   drivers/input/keyboard/tm2-touchkey.c:335:34: error: ‘tm2_touchkey_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
