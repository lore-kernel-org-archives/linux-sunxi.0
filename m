Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8335538C
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Jul 2022 23:36:02 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q9so8673536wrd.8
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Jul 2022 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=HCNYGow5nVdiUj8HiGxZTHr1Lk6MTCK4vh2T29V1oIg=;
        b=Qcc5wrLPF/njXC8FuWZ6W3lo5Yfu237T82ALxteoHtlauDWpJf9mTmfuvFydtfXyUR
         5j/VqvGP85Iuj8OtgTKFj8mlsY8r50CFZOXru/fWv1qfgO7sK9tV7WmMirzpZsKN5UwW
         7YkBP7bqVhRwZrq69mjlWG5WGuA4RPwp8XiJBt4s0bcOtZ6jlqcOMqo1sXGTpmLYP2KY
         bIfR/2SPA93eQQtcc4Gh7fRITNkVQ97ryPgO7Li1VTqDl/MA//ohEdkjpYF3eOEjipTW
         IPOCAHipK5LlpefuwnC5P5zGNaMWWyd8CW6pFOT+XnDtpIg5BfMqYmb5SctlyktLfMpk
         MUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=HCNYGow5nVdiUj8HiGxZTHr1Lk6MTCK4vh2T29V1oIg=;
        b=mX2JaEixd/EDFuFtYaTojZflcn8fhFP/Kr+cV58qT49YG2UqZw4N1klzEsE482+ywE
         ktYg4u1zaB3LHvJFh0p2xh9rfBbR2GqLcoUE/O5lYzHMMNZxeceneu2gJiIqriq2BTmd
         FS8jHlRRjAp9mjP2ks5RM7N8i0fQxzhs3UD4gjep/TV3GTXddbdNF1l0Mwr2s7iMptgy
         6mcCUGL5r+NtEQniNUVXYWNDDPbnGFxfZyJrdCN0GZpamDC6VmJzaQ4PfaBIs4VXvTZR
         eiHTKA8hX3SyX7r5BVLf8CyshNORZ2cOePEPW466bIOf0pwj70LSbYPFtXn6+MLVUmcr
         vgtw==
X-Gm-Message-State: AJIora9Xv6ltPSYzNMNoeiVs4bwnsJtETP1weo/vDTNDZ9798D+baqe5
	zaXvrDvchRGr7LN82C8GjDg=
X-Google-Smtp-Source: AGRyM1vFZEEGxe0/NqO66n84cNHfCFwmZT4A06oMZkgd7GN++rMg200OBDIkjx2TmD6Xff0aOn1owA==
X-Received: by 2002:adf:f705:0:b0:21d:74fa:c043 with SMTP id r5-20020adff705000000b0021d74fac043mr14989190wrp.77.1657928161014;
        Fri, 15 Jul 2022 16:36:01 -0700 (PDT)
Received: from debian (host-78-150-47-22.as13285.net. [78.150.47.22])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c3b1100b003976fbfbf00sm8352791wms.30.2022.07.15.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 16:36:00 -0700 (PDT)
Date: Sat, 16 Jul 2022 00:35:58 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: build failure of next-20220715 due to "No rule to make target"
Message-ID: <YtH53r9UcYwquxcx@debian>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

Not sure if it has been reported, builds of arm and arm64 allmodconfig
have failed to build next-20220715 with the error:

make[3]: *** No rule to make target 'drivers/pinctrl/sunxi/pinctrl-sun20i-d1.o', needed by 'drivers/pinctrl/sunxi/built-in.a'.  Stop.


--
Regards
Sudip
