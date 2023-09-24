Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7AB19B;
	Sun, 24 Sep 2023 02:48:28 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3ab3aa9ae33so2943462b6e.2;
        Sat, 23 Sep 2023 19:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695523707; x=1696128507; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqzUc5Ca0TLk51f9yoIdIBC/lxIeRKZcx3CKiVIdjzQ=;
        b=AyiOHS5sg0aTfkjDcE13rWHFrlI3KgFUdnHav5fUO944rgsVxGlWS4SvZQpIB++QU4
         S+o3dEx+spydV9n3xKBCqo0i+xJP8c6U4kgqlJpQaumuAJNoqQE5I0p8hq1uffjbvliJ
         ufQ1p/STfamYcOBkSNde0UQ4Z3vmteTOTFpZvMx5sohUAe13wSo59WAnYiHO/b22dWn8
         NfJTSBW8YIETVUJck5Ud9cFROHTVCA7HUYLM8ibWKtxA3ATDWu9sb7d0S5wjbvUjGtmy
         /KUZlsHbgr8vznPvvmDmzFWLxlPaJ7kJo8B4rkCTYQnhbMarRLvwvEmSECzw0zh90gmF
         lg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695523707; x=1696128507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqzUc5Ca0TLk51f9yoIdIBC/lxIeRKZcx3CKiVIdjzQ=;
        b=GQd95xTyIJtd++tecygeFLLVpRp4Dazz8K0tQHn8nZByGG8s3RvFeyRtvr9jeahsGZ
         jUniA2vzyzBHK9cdB1cxJ9CiKqCTl4RQODV/Fx0NaK0leXdroxQdRczTbwWnpZsP/t38
         u/lmEz27VotufJZyQ26leuXUonLops8yL43Yd2Li/HodhOD77rGx2im3bLArVuxPxa7m
         GhleyJjanQiVG5gKqHSef4F6Fujk5IJMbIzq4L/OhnohY0FbKNbRRBdN/PfsXCdohGc0
         EMaXVc+hJcgD1LO2cIyFXblG/TK4ZhF2kP8ByeYMgnbNe90EEdQem8m+5hXS/qRF53e1
         j4FA==
X-Gm-Message-State: AOJu0Yzt1PPaDZozFjq+8a7x/JgwXLaQP3p2S913vkWvxIqo6/S/pR7z
	t/XMBsys2hKXqjxpzToBvwI=
X-Google-Smtp-Source: AGHT+IFsJQ1vfOpuk2IaQRPrCUNaPYRrBLQFBvu86Kz8YHQlL7Jz8q3Be91hgZK6q2QTnHVxxVtMXg==
X-Received: by 2002:a05:6808:15a5:b0:3ad:f86a:877b with SMTP id t37-20020a05680815a500b003adf86a877bmr5344294oiw.23.1695523707158;
        Sat, 23 Sep 2023 19:48:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3d36:f550:baf4:ae75])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902748100b001bbc8d65de0sm6050106pll.67.2023.09.23.19.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 19:48:26 -0700 (PDT)
Date: Sat, 23 Sep 2023 19:48:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org, kernel@pengutronix.de,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
	chrome-platform@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Jeff LaBundy <jeff@labundy.com>, Rob Herring <robh@kernel.org>,
	Siarhei Volkau <lis8215@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Support Opensource <support.opensource@diasemi.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Miloslav Trmac <mitr@volny.cz>, patches@opensource.cirrus.com,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Liang He <windhl@126.com>, Chen Jun <chenjun102@huawei.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	Michal Simek <michal.simek@amd.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 00/52] input: Convert to platform remove callback
 returning void
Message-ID: <ZQ+jddG+UbuSD7pP@google.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>

On Wed, Sep 20, 2023 at 02:57:37PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/input to use
> remove_new. The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply or a subject prefix is suboptimal, please apply the remainder of
> this series anyhow.

Applied the lot (fixing the i8042-sparcio patch subject), thank you!

-- 
Dmitry
