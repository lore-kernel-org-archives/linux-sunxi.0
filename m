Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355F824505
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 19:58:41 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-349099fce6dso699515ab.2
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 12:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691611121; x=1692215921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngElyP+O5dBb1szJeU9VS0shhzstefNV8cg6TIc9IaU=;
        b=GyPlxdd7MzCYVmOYfHBX2HJxmYKn5SkqMlMlj0fFLJZHmntfkm091rQe91crGnp39B
         WYWfll0bVqsctjTmxFZ9Sk1yoiZgKfMLxgocooKji4EG6MD9SnMWAvUmBrX/j4gCy4jq
         E/7PxAAxXilBoPRd4/h7/gcXuJrZHbgouPxp4qcyLY8lRtqimdRB6CF8g6j6IvYD8RXA
         QZLR+BAkNNWu35OcV71cHDuE1muJcMFsG7eShSgCRFufipyQc5HVgnwYbuugOFNeJnk/
         ezQF0t3cAKPHRlJ92tr69suR98TwLKBmWdw5+YmGPm+WfzgA+ebaPbSwtLqs7f22eNI1
         fnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611121; x=1692215921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngElyP+O5dBb1szJeU9VS0shhzstefNV8cg6TIc9IaU=;
        b=ekPZ6OxIovP+AZ+C3MT717RXw3TCJiDp6B/jPTtjAscjFqAJ0vWD25/VEM6CnlFXgj
         U2aeLBS1bEG70namLYsSUxF27tnK0lE85nS2jtRT5h+c/pfJ8rNYQSD5W9wWY1K1lW4E
         2SpGhhbPpz9JiC3BICU4xb2T9rJFvkrXV5ajKggdcar4aT0m5hhLwAYv2QGSs+bbv4NE
         KBUIpI3wiOTfWO1TGXPBaaZJ0rKbOleYX95Xo7Vd/OmRB0ActxQR8RVSaqtX2IL3qLrc
         Yz7OfbM7KgHAooBAmmBj3JEpvjL5h52shWvhMd42JYn78umxcQfsaiMS8Jss3ox06wkz
         Ry3A==
X-Gm-Message-State: AOJu0YyU389XtcJLZarXb2dW1fw2UzbF+hXe8THjNA1N3bpeutb3Bi2E
	ZVBrcTLvptedarvHj1mnLfw=
X-Google-Smtp-Source: AGHT+IHaqQX6Kp3Y3HBz6hj7cJEa8aO+fBZ4LxhSFWwFYUmzJEVy/2z/GKLWvVJ5DwhCEvAxhpD6Zg==
X-Received: by 2002:a05:6e02:96d:b0:349:7cec:db76 with SMTP id q13-20020a056e02096d00b003497cecdb76mr70189ilt.31.1691611121122;
        Wed, 09 Aug 2023 12:58:41 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:6e71:1f10:2120:d11d? ([2001:470:42c4:101:6e71:1f10:2120:d11d])
        by smtp.gmail.com with ESMTPSA id x12-20020a92de0c000000b0034912793df5sm4449727ilm.41.2023.08.09.12.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 12:58:40 -0700 (PDT)
Message-ID: <6eb804eb-6d99-0d0e-13c6-55f88e7b0a6b@gmail.com>
Date: Wed, 9 Aug 2023 13:58:40 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/20] sunxi: remove CONFIG_MACPWR
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-3-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

Ditto my response to the previous patch.

On 7/21/23 07:45, Andre Przywara wrote:
> The CONFIG_MACPWR Kconfig symbol is used to point to a GPIO that enables
> the power for the Ethernet "MAC" (mostly PHY, really).
> In the DT this is described with the phy-supply property in the MAC DT
> node, pointing to a (GPIO controlled) regulator. Since we need Ethernet
> only in U-Boot proper, and use a DM driver there, we should use the DT
> instead of hardcoding this.
> 
> Add code to the sun8i_emac and sunxi_emac drivers to check the DT for
> that regulator and enable it, at probe time. Then drop the current code
> from board.c, which was doing that job before.
> This allows us to remove the MACPWR Kconfig definition and the respective
> values from the defconfigs.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Sam Edwards <CFSworks@gmail.com>

Thanks,
Sam
