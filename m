Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5492C81
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Nov 2021 23:35:16 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id q74so1832666ybq.11
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Nov 2021 15:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5HVBVN9+sTrLodgeig4D1EWIc9RQ5SNWBFmWu98vXL0=;
        b=m5JawtXtWeiQw3aHEyu9p0VYlJikxcpIr31dpHDY0FQW/6rGc9SQ5fXJhpct9IBc1t
         Xl10OV4hGbVIEYQmqGmsQzFKGp58jK6ZLZg7lA/2y1wR13agUJfEon3WK01JLupyRCLx
         g2kI29tQvDoH/b1eWEE4Ni+ezKwBX/4vAy4ARCrao2ehaEyCHMZKQlunVj1ZZ8XuERuZ
         A5XHeCbgtiUCLiBgIJIPvoeWSNu4/Hg8+6Fbc1KW9tZIdwctDn43nLzEr8qMeSpAla8j
         V2KXXfnTJkQpJqAOx3EnpEU3BvUczcRrpq5oLg0QBuQvSG4PRVOpJ2b/L9rE2GZoCcuy
         CEaA==
X-Gm-Message-State: AOAM532in9+EzQexxADzuJvQKv326Xf1pZRE7hxmm8l/cW6OjqVUqOVg
	KIoQhJTxSWvrsbkpIor9i28LRsj3MGkhAnXCkbQ=
X-Google-Smtp-Source: ABdhPJw/S8b+4DBi3I9No3zeqKoBNlDBHhzozk6T4jzYhC+n6oU4VdXxRo1GxJXjZxWTLDQlmooFebwqfimrYkzrznk=
X-Received: by 2002:a25:d214:: with SMTP id j20mr10478211ybg.536.1637710515640;
 Tue, 23 Nov 2021 15:35:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211123115333.624335-1-mailhol.vincent@wanadoo.fr> <bc682dbe-c74e-cd8a-ab05-78a6b4079ebf@hartkopp.net>
In-Reply-To: <bc682dbe-c74e-cd8a-ab05-78a6b4079ebf@hartkopp.net>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 24 Nov 2021 08:35:04 +0900
Message-ID: <CAMZ6RqJ_Kj48Zuv=zzPawcQw4qkgxa=u9aHgH8Ggq9MQZosS_Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] fix statistics for CAN RTR and Error frames
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed. 24 Nov. 2021 at 06:10, Oliver Hartkopp <socketcan@hartkopp.net> wrote:
> On 23.11.21 12:53, Vincent Mailhol wrote:
> > There are two common errors which are made when reporting the CAN RX
> > statistics:
> >
> >    1. Incrementing the "normal" RX stats when receiving an Error
> >    frame. Error frames is an abstraction of Socket CAN and does not
> >    exist on the wire.
> >
> >    2. Counting the length of the Remote Transmission Frames (RTR). The
> >    length of an RTR frame is the length of the requested frame not the
> >    actual payload. In reality the payload of an RTR frame is always 0
> >    bytes long.
> >
> > This patch series fix those two issues for all CAN drivers.
> >
> > Vincent Mailhol (2):
> >    can: do not increase rx statistics when receiving CAN error frames
> >    can: do not increase rx_bytes statistics for RTR frames
>
> I would suggest to upstream this change without bringing it to older
> (stable) trees.
>
> It doesn't fix any substantial flaw which needs to be backported IMHO.

I fully agree. Bringing it to the stable trees would be a
considerable effort and was not my intent either (thus the
absence of "Fixes" tags).

> Btw. can you please change 'error frames' to 'error message frames'?
>
> We had a discussion some years ago that the 'error frames' are used as
> term inside the CAN protocol.

ACK. Thanks for the clarification on the vocabulary.

Yours sincerely,
Vincent Mailhol
