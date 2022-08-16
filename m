Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73761FDA
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 07:41:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id c28so9641826lfh.3
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z4YfB/AJeb982Xz2QYWpjFSws7upX3bELQnOSH90aGQ=;
        b=XNiAZ2MhGZde1OxcLeMx6rt6sGhm0MIYRYttklKEzARCVhtOjGTS0I5VuPCcpOoZq4
         AazIXWhkMfjWgm8AzXKS5TOFgz5lSEPLZzZ/BEUT+8Lm5H80GyoGLmJs0BSb4GWCZgoS
         JCqkF8hGO/4+8FfYNJ9xcdWEeGg7O7tBBr24kUBYSb/BPEDblFxPKfK5Gw96lxzkFEzt
         ER3UACt0W0pzppQyL+RJMr5S6YAkykB6raCdrkeY6SWQR/Sers/mv4s67CwuCykj4Tzi
         Mvx2YvrL1HS2p5yB8blMpvmxW38bgtOdagu886tBN0axwkfs/RY5+yT77lu2oY8h6x/u
         AWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z4YfB/AJeb982Xz2QYWpjFSws7upX3bELQnOSH90aGQ=;
        b=IsfrGrGuzjV7nd/4gh5Pwf3uk6giKhGEd2NZ6mu7HPYp1pLCsstWO3ly8rgHT7f4Yi
         pNP3gRl5w6kf3gBljB7tX43lRSGpIOb3KuFCNyqjEPy7t8CxVte7p5QyNfUxEA+3Lt6z
         kRXjDkBAAk7KtRPnSXuD/j4WnZubwDFdlV+SSq7miJl74tDqvXq35W0SD2z3psegjy0h
         p7nBNj6UBNLsPvEQrShAlo/sOEEFfHC9TszFBn1KCNyXB4tSq9JdU2dOZSRsV7hCSTZY
         GUIayeX7zEZGyg7yiO558+GRdiDtMqF6JEOQ/NaHS2pkkQes7wQEFCLSXKVcdmOMTKdL
         0g3A==
X-Gm-Message-State: ACgBeo3lIFVSLBN6zcDD0PVLjBoZaAK9Zrebdu4hy7zJ0T8QyIli9QB5
	sB5SIJlAiSgQxySR2q9YF0fLUA==
X-Google-Smtp-Source: AA6agR7yvXIG3FQUMlg6GW8tRa6cjzG0FZZbYwcSTqvWyjhEU2eExfEr5GNYE/fJJDjnTXq1o1QwNw==
X-Received: by 2002:a05:6512:6d3:b0:48a:e68c:15c9 with SMTP id u19-20020a05651206d300b0048ae68c15c9mr7099789lff.488.1660635706920;
        Tue, 16 Aug 2022 00:41:46 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id 15-20020a2eb94f000000b0025d53cbba2bsm1704014ljs.45.2022.08.16.00.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:41:46 -0700 (PDT)
Message-ID: <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org>
Date: Tue, 16 Aug 2022 10:41:45 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815050815.22340-7-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2022 08:08, Samuel Holland wrote:
> +
> +	de: display-engine {
> +		compatible = "allwinner,sun20i-d1-display-engine";
> +		allwinner,pipelines = <&mixer0>, <&mixer1>;
> +		status = "disabled";
> +	};
> +
> +	osc24M: osc24M-clk {

lowercase

> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;

This is a property of the board, not SoC.

> +		clock-output-names = "osc24M";
> +		#clock-cells = <0>;
> +	};
> +


Best regards,
Krzysztof
