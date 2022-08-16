Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451091FAC
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 05:55:12 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id z25so13424665lfr.2
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 22:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SM85WUFG4iEcrdGXUW1ovRXHJvVq4YoOra1Othbb/sI=;
        b=EwhBI+O8yhjttvfqkMyGgqju7SabAqYWbFGrQ9MqCy/t8smDKOrX4ZLMlouZVonOz6
         iwvUksftnAVCQQ7TsS7aZFhUmu0J1KZ0nv0sISODZ/JJm25kK6/oh3Z5hRk4iHlbdsyy
         OLFSD4mtvOZ6G6kjpeHJI+nEF0AzSt6YDOaTTqEP6TUJJcWxVbhfCK/EvupvSqvb11a2
         2t1zArEwfbv+BviVGZO1nHlkcm46oGvdOGa2Tzc0elglZ2hnByt0eGRQkeQhiWK5pABR
         nmm83J4PIgVhKmKs8nE/LYEcrRuI2syBUzb5wbOaZIccCAceLxa1Z5hwXW0JMoDIHIKI
         lRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SM85WUFG4iEcrdGXUW1ovRXHJvVq4YoOra1Othbb/sI=;
        b=fdhyOhPzG9JlkQck7crvZBS/WRC0fgyP/L36vpD/AnemG1LCR2YW8XQkZJNdO62QNf
         eP0JQprtINbZtSW12rPEAhhj1Pq3HWuxaY3zLQM6GKnxFD/nUX75yX9SedU3Jefcuq0C
         Xro5F6oXqQKiX1qo2lwbRzxqNMqCbDGkytx810yfiWC8SXfrO1TqqVNf0djaCQnX6OB1
         hGdgUkewCpDB9Xxoaza/xgXUiN4nAU5kslPukQcvsJtwP4nKQcdAUdwZA+bq0R1atfXp
         kFdo0wIawb3Jcn/QgJL3fGLvg+xYHA9h8MYl9jZMA0DZnfXKn8w3QWl8Onibc2P/m0TM
         s1iQ==
X-Gm-Message-State: ACgBeo04cGYzQrSsy+0+WQwpkr/JaKgQn3Ym/Cix/1JJN2RFcKW11sZI
	VNBukT+GRsMqtjR/y8eTTbSDyA==
X-Google-Smtp-Source: AA6agR7IeUpFg8yHso/TiNxbVUWwOdABAJVuP+7GB6b2iz3fuXp47F/1wpnpJjS37Xv39u1GZHp8gQ==
X-Received: by 2002:a05:6512:304c:b0:48c:ed09:1e95 with SMTP id b12-20020a056512304c00b0048ced091e95mr7274477lfb.642.1660629310351;
        Mon, 15 Aug 2022 22:55:10 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id o15-20020a05651205cf00b00491203d6cc9sm935238lfo.131.2022.08.15.22.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 22:55:09 -0700 (PDT)
Message-ID: <7f1e6b96-49f6-e83c-7711-d6a60cd012e2@linaro.org>
Date: Tue, 16 Aug 2022 08:55:07 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 01/10] dt-bindings: sram: sunxi-sram: Clean up the
 compatible lists
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220815041248.53268-1-samuel@sholland.org>
 <20220815041248.53268-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815041248.53268-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2022 07:12, Samuel Holland wrote:
> Use enumerations where appropriate to combine "const" choices and
> deduplicate fallback compatible strings.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v2:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
