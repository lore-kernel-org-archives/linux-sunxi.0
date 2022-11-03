Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377B29A8
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Nov 2022 20:45:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d20so1989847plr.10
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Nov 2022 13:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TLGL+1sBhWgs2XefR8YTN33XJCg0oqxzr77Q79l6mlE=;
        b=fUHfb08ygdfQEamXM9zHbvfr3Gyk4DgXzrJGP6pYGyGx3iS25SGccmMiP28DUkdHOB
         CjDr2tcd+/XQUAtdx7AxrPd9/eqM40jnQH/s1otATz/lNkQvoh8Qx1ZSNGv0O0W94aut
         JyAR1fjH3oOBICyL/y/mkUq6jZX8BDtMOow3n43lqDuk1Xv7FQ0LJ3zs/VrhESgQz6N/
         1tZE85YD2KnzN4k5bAKYoM+EOoIwnr0mio77E9cq76crETR5G21vEp65EeG+DdahUKYj
         +I9byiyjxHOizx5z0IEdDc2jyYrXH1GbOO2XwXTQSrK+OcOInS4+XgdvFskKKBBh7/e3
         eYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLGL+1sBhWgs2XefR8YTN33XJCg0oqxzr77Q79l6mlE=;
        b=5QuFKo6GrFJgRMKPT8MUa5Re13rz+UemWhwudpZohhAvDDILTdyAGV2Ja95MK78p/Y
         ZrOYjm3iEjzXgQqj1hpbkX446h+Nkq6BH+xVQv6qtSEAdC1TjlIsZmrrem78DbySCkEf
         pm7fqHIioLX8w7E1CXDQRT+M3Z8Qk4NDfzqiwBNXC/9RML2DNOjbK+i6hT4OOGVXvSwO
         2hKZ0TlqSKcGcIq5qNosYejO9YVZAPyBzXGghiXtZax0a0aQErWJ3CcsEma+U6ARNg2O
         w4+CwY3sTx1LEp4HZO7hwojMz1oAAQcv+jVnQZeHsZrqHsHsXRgHu9ntJjX1Wwo52iak
         SB6A==
X-Gm-Message-State: ACrzQf0pKzjx+aETtPmJ7fLDzIPrQQzybjkMQAlvbiDcILlEDxxCB1Rr
	gGbVSOjeWVZ4n+wQxO/tVTc=
X-Google-Smtp-Source: AMsMyM7nWdeDmd9380z+yPFUYDyp3AXPhjRf+v30Xcxkxakb97UmFBc2uzh1ldowGZg04rAeZ/xFkA==
X-Received: by 2002:a17:90a:e38b:b0:212:d42a:c0a9 with SMTP id b11-20020a17090ae38b00b00212d42ac0a9mr49817372pjz.179.1667508348480;
        Thu, 03 Nov 2022 13:45:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 76-20020a62194f000000b0056c3d3f5a8dsm1191648pfz.56.2022.11.03.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 13:45:47 -0700 (PDT)
Date: Thu, 3 Nov 2022 13:45:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 8/9] dt-bindings: input: sun4i-lradc-keys: Add F1C100s
 compatible
Message-ID: <Y2QoeAo8bM7YYJJc@google.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-9-andre.przywara@arm.com>

On Tue, Nov 01, 2022 at 02:16:57PM +0000, Andre Przywara wrote:
> The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
> compatible to the version in other SoCs.
> The manual doesn't mention the ratio of the input voltage that is used,
> but comparing actual measurements with the values in the register
> suggests that it is 3/4 of Vref.
> 
> Add an F1C100s compatible string to the list, and pair it with the
> A83T fallback. Since the A64 is the same, combined both using an enum.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thank you.

-- 
Dmitry
