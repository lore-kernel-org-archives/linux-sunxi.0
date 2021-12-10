Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E402C80
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Dec 2021 08:57:47 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id y8so5857892plg.1
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Dec 2021 00:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacecubics-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o78r8oCqesWT7jqTVPoth6IM19LStgzO1ZNNWGxpAcg=;
        b=vPd16In+A27Rtsr9JY+O/2Hhe6R2WbhGgeymIxYHdMog/u8sC6FA+A0AYVoLk8xwMA
         iDtr43nagI2JOPL5sk04xRMumKM2+C07uZI8HTbJjJZYO9NAjbuIFc+56B0kue+bMtJe
         G8JJbVJ8LmbR1w1tfl0lBJEXDZfid+5OXvO5GNNDE8U/uAN+kdpvRp7jRBFf6Q4oOUmh
         7h4Z5cwDvC8EdQOMUOGB0GNgQkU5mVVs8Y50vIRQV0gWVxVzGRsWJpXWGmdl0GGo4lis
         mb6+Ezxjoj4G28UsTlCPq2Jq0orWzGVTXEA47Ch7TO8IlC1+Euhf61FdP2jz/DPL3LZz
         aFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o78r8oCqesWT7jqTVPoth6IM19LStgzO1ZNNWGxpAcg=;
        b=alsAIiyVcCCBoscP01+VmgyO2Y+iXVIhD8+hD2F37vo598taMvGB37aqTs6lgdozqn
         hYd7n53l+wpCWRqFDxhUtL92tuLxIyYKW/fuwmk6kujss5djwr5qpxahxtQviC/LEUo9
         ss02/S9A1iPa7ssGCcuE69QFsHie+GVQ92sq5Fg3RFkStXThYa0Aux9IBYGYd8b/Vq8P
         BtS19EHAg82rS8jrfcjo4XSQz05ClVtxxkwtmK5eYmsjwgM4JM22Zr2bLEjw84FNRCH5
         gQLyEXQuhJaRxf1Sa8g90lvW5N52l92nbSNe1zTWcZl/5CRzMJgii01pm88egFLnjQAF
         MsMQ==
X-Gm-Message-State: AOAM531MgXaflO6vBg14LsNicNOp/ZJI4ZNM5sB97PN9OhV0H0ZjfcmI
	cZrZ+t5Pe40WTtxYwxRi+An6PufC2JkUeySQkgtFrw==
X-Google-Smtp-Source: ABdhPJyStS5NlCVO8vdDsg26SLoOFytFOZeSf1AZFKF4jXizeNkyXoXGEeLcX55fgZCj2gqpe0wshFUG6BWMGgUQ+t0=
X-Received: by 2002:a17:90a:d515:: with SMTP id t21mr22452866pju.123.1639126666591;
 Fri, 10 Dec 2021 00:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211207121531.42941-1-mailhol.vincent@wanadoo.fr> <20211207121531.42941-4-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20211207121531.42941-4-mailhol.vincent@wanadoo.fr>
From: Yasushi SHOJI <yashi@spacecubics.com>
Date: Fri, 10 Dec 2021 17:57:35 +0900
Message-ID: <CAGLTpnJp_v3Eev61gPWRi6fzj400mUR7hLmezXGc2RmA7XDcoA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] can: do not copy the payload of RTR frames
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Jimmy Assarsson <extja@kvaser.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Tue, Dec 7, 2021 at 9:16 PM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> The actual payload length of the CAN Remote Transmission Request (RTR)
> frames is always 0, i.e. nothing is transmitted on the wire. However,
> those RTR frames still use the DLC to indicate the length of the
> requested frame.
>
> For this reason, it is incorrect to copy the payload of RTR frames
> (the payload buffer would only contain garbage data). This patch
> encapsulates the payload copy in a check toward the RTR flag.
>
> CC: Yasushi SHOJI <yashi@spacecubics.com>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

It works and LGTM.

Tested-by: Yasushi SHOJI <yashi@spacecubics.com>
-- 
              yashi
